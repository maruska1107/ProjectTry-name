package com.example.sweater.Controllers;

import com.example.sweater.Services.MessageService;
import com.example.sweater.domain.Message;
import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.repos.MessageRepo;
import com.example.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.UUID;

@Controller
public class MessageController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private MessageService messageService;
    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "")
                               String filter, Model model,
                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Message> page = messageService.messageList(pageable, filter);
        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("filter", filter);

        return "main";
    }


    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Map<String, Object> model,
            @RequestParam("file") MultipartFile file

    ) throws IOException {
        ZonedDateTime date = ZonedDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy Время: HH:mm");
        String data = date.format(formatter);
        String status ="Отправлено";
        Message message = new Message(text, tag, user, data,status);

        saveFile(file, message);

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "main";
    }

    private void saveFile(MultipartFile file, Message message) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
        }
    }

    @GetMapping("/user-messages/{author}")
    public String userMessges(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<Message> page = messageService.messageListForUser(pageable, currentUser, author);

        model.addAttribute("userChannel", author);
        model.addAttribute("page", page);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("url", "/user-messages/" + author.getId());

        return "userMessages";
    }

    @GetMapping("/sort-messages/{author}")
    public String userMessagesSort(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Page<Message> page = messageService.messageListForUser(pageable, currentUser, author);

        model.addAttribute("userChannel", author);
        model.addAttribute("page", page);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("url", "/user-messages/" + author.getId());

        return "userMessages";
    }

    @GetMapping("/statusActiveUser")
    public String statusActiveForUser(@RequestParam(required = false, defaultValue = "В процессе")
                               String status, Model model,
                               @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Message> page = messageService.messageListStatus(pageable, status);
        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("status", status);
        return "userMessages";
    }

    @GetMapping("/statusAllUser")
    public String statusAllUser(@RequestParam(required = false)
                                      String status, Model model,
                                      @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Message> page = messageService.messageListStatus(pageable, status);
        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("status", status);
        return "userMessages";
    }

    @GetMapping("/edit-messages/{author}")
    public String editMessges(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable

    ) {
        Page<Message> page = messageService.messageListForUser(pageable, currentUser, author);

        model.addAttribute("userChannel", author);
        model.addAttribute("page", page);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("url", "/user-messages/" + author.getId());

        model.addAttribute("users", userRepo.findByRole());

        return "editMessages";
    }

    @GetMapping("/statusNew")
    public String statusNew(@RequestParam(required = false, defaultValue = "Отправлено")
                         String status, Model model,
                         @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Message> page = messageService.messageListStatus(pageable, status);
        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("status", status);
        return "main";
    }
    @GetMapping("/statusActive")
    public String statusActive(@RequestParam(required = false, defaultValue = "В процессе")
                         String status, Model model,
                         @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Message> page = messageService.messageListStatus(pageable, status);
        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("status", status);
        return "main";
    }
    @GetMapping("/statusDone")
    public String statusDone(@RequestParam(required = false, defaultValue = "Завершён")
                       String status, Model model,
                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Message> page = messageService.messageListStatus(pageable, status);
        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("status", status);
        return "main";
    }



////////////////////////////////Employee////////////////////////////////////////////////

    @GetMapping("/employee-messages/{author}")
    public String employeeMessqges(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<Message> page = messageService.messageListForEmployee(pageable, currentUser, author);

        model.addAttribute("userChannel", author);
        model.addAttribute("page", page);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("url", "/user-messages/" + author.getId());

        return "userMessages";
    }
    //Назначение сотрудника
    @PostMapping("/edit-messages/{employee}")
    public String updateMessage(
            @PathVariable User employee,
            @RequestParam("id") Message message
    ) throws IOException {

        message.setStatus("В процессе");

        message.setEmployee(employee);

        messageRepo.save(message);


        return "redirect:/main";
    }
    @GetMapping("/statusDoneByEmployee")
    public String statusDoneByEmployee(@RequestParam(required = false, defaultValue = "Отказано сотрудником")
                                       String status, Model model,
                                       @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable) {
        Page<Message> page = messageService.messageListStatus(pageable, status);
        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("status", status);
        return "main";
    }

    @GetMapping("/edit-status/{author}/{status}")
    public String editMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User author,
            Model model,
            @RequestParam(required = false) Message message,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable

    ) {
        Page<Message> page = messageService.messageListForUser(pageable, currentUser, author);

        model.addAttribute("userChannel", author);
        model.addAttribute("page", page);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(author));
        model.addAttribute("url", "/user-messages/" + author.getId());

        model.addAttribute("users", userRepo.findByRole());

        return "editMessagesEmployee";
    }

    @PostMapping("/edit-status/{author}/{status}")
    public String updatStatusCancel(
            @PathVariable String status,
            @RequestParam("id") Message message
    ) throws IOException {
        message.setStatus(status);
        messageRepo.save(message);
        return "main";
    }
}
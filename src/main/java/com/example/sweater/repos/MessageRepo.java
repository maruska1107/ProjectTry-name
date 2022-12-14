package com.example.sweater.repos;
import com.example.sweater.domain.Message;
import com.example.sweater.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
public interface MessageRepo extends CrudRepository<Message, Long> {
    Page<Message> findAll(Pageable pageable);
    Page<Message> findByTag(String tag, Pageable pageable);
    Page<Message> findByStatus(String status, Pageable pageable);
    @Query("from Message m where m.author = :author")
    Page<Message> findByUser(Pageable pageable,  @Param("author") User author);
    @Query("from Message m where m.employee = :employee")
    Page<Message> findByEmployee(Pageable pageable,  @Param("employee") User employee);





}

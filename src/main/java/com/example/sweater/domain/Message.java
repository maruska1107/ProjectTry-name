package com.example.sweater.domain;

import javax.persistence.*;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    private String text;
    private String tag;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;
    private String filename;
    private String data;
    private String status;



    public Message() {
    }

    public Message(String text, String tag, User user,String data,String status) {
        this.author = user;
        this.text = text;
        this.tag = tag;
        this.data=data;
        this.status=status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        status = status;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }
    public String getAuthorNname() {
        return author != null ? author.getName() : "<none>";
    }

    public String getAuthorFamily() {
        return author != null ? author.getFamily() : "<none>";
    }

    public String getAuthorPatronymic() {
        return author != null ? author.getPatronymic() : "<none>";
    }
    public String getAuthorEmail() {
        return author != null ? author.getEmail() : "<none>";
    }
    public String getAuthorNumber() {
        return author != null ? author.getPhone() : "<none>";
    }

    public String getAuthorAdress() {
        return author != null ? author.getAddress() : "<none>";
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getFilename() {
        return filename;
    }


    public void setFilename(String filename) {
        this.filename = filename;
    }
}
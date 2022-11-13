//package com.example.sweater.domain;
//
//import javax.persistence.*;
//import java.util.Objects;
//import java.util.Set;
//
//@Entity
//public class Employee {
//    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
//    private Long id;
//
//    @OneToMany(mappedBy = "employee", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
//    private Set<Message> messages;
//
//    @OneToOne(fetch = FetchType.LAZY)
//    private User emp;
//    private String nameSpec;
//    private String familySpec;
//    private String patronymicSpec;
//
//
//    @Override
//    public int hashCode() {
//        return Objects.hash(id);
//    }
//
//    public Long getId() {
//        return id;
//    }
//
//    public void setId(Long id) {
//        this.id = id;
//    }
//
//    public String getNameSpec() {
//        return nameSpec;
//    }
//
//    public void setNameSpec(String nameSpec) {
//        this.nameSpec = nameSpec;
//    }
//
//
//    public String getFamilySpec() {
//        return familySpec;
//    }
//
//    public void setFamilySpec(String familySpec) {
//        this.familySpec = familySpec;
//    }
//
//    public String getPatronymicSpec() {
//        return patronymicSpec;
//    }
//
//    public void setPatronymicSpec(String patronymicSpec) {
//        this.patronymicSpec = patronymicSpec;
//    }
//}

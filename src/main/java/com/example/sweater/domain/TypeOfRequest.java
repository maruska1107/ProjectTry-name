package com.example.sweater.domain;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="TypeOfRequest")
public class TypeOfRequest {
    @Id
    @Column(name="id")
    private Integer id;
    @Column(name="nameReq")
    private String nameReq;
    @Column(name="id_spec")
    private String id_spec;

    @OneToMany(mappedBy = "typeOfRequest", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TypeOfSpec> typeOfSpecList;

    public TypeOfRequest() {
    }

    public String getId_spec() {
        return id_spec;
    }

    public void setId_spec(String id_spec) {
        this.id_spec = id_spec;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameReq() {
        return nameReq;
    }

    public void setNameReq(String nameReq) {
        this.nameReq = nameReq;
    }

}

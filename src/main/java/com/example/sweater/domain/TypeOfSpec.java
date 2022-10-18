package com.example.sweater.domain;

import javax.persistence.*;

@Entity
@Table(name="TypeOfSpec")
public class TypeOfSpec {
    @Id
    @Column(name="id")
    private Integer id;
    @Column(name="nameSpec")
    private String nameSpec;

    //Один тип к разным сотрудникам
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_type")
    private TypeOfRequest typeOfRequest;

    public TypeOfSpec() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameSpec() {
        return nameSpec;
    }

    public void setNameSpec(String nameSpec) {
        this.nameSpec = nameSpec;
    }
}

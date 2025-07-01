package com.bibliotheque.models;

import jakarta.persistence.*;

@Entity
@Table(name="Restriction")
public class Restriction {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="idrestriction")
    private Integer idRestriction;

    @Column(name="age")
    private Integer age;

    public Integer getIdRestriction() {
        return idRestriction;
    }

    public void setIdRestriction(Integer idRestriciton) {
        this.idRestriction = idRestriciton;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    
}

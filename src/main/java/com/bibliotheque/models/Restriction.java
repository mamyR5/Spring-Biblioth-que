package com.bibliotheque.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Restriction")
public class Restriction {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id_Restriction")
    private Integer idRestriction;

    @Column(name="Age")
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

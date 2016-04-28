 
package com.mary.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
 
/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
@Entity
@Table(name="TECHNOLOGY")
public class Technology {
 
    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
     
    @NotNull
    private String name;
     
    @NotNull
    private String chapter;
 
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public String getChapter() {
        return chapter;
    }
 
    public void setChapter(String chapter) {
        this.chapter = chapter;
    }
     
    @Override
    public String toString(){
        return "id="+id+", name="+name+", chapter="+chapter;
    }
}
package com.mary.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mary.model.Technology;

/**
 * Technology dao interface
 * 
 * @author DevCrumb.com
 */
@Repository
public interface TechnologyDao {
	
    public void addTechnology(Technology p);
    public void updateTechnology(Technology p);
    public List<Technology> listTechnology();
    public Technology getTechnologyById(int id);
    public void removeTechnology(int id);
    
}

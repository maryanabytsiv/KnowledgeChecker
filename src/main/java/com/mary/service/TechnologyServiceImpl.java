/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mary.service;

/**
 *
 * @author mbytsiv
 */
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.mary.model.Technology;
import java.util.List;
import com.mary.dao.TechnologyDao;
 
@Service
public class TechnologyServiceImpl implements TechnologyService {
     
    private TechnologyDao technologyDAO;
 
    public void setTechnologyDAO(TechnologyDao technologyDAO) {
        this.technologyDAO = technologyDAO;
    }
 
    @Override
    @Transactional
    public void addTechnology(Technology p) {
        this.technologyDAO.addTechnology(p);
    }
 
    @Override
    @Transactional
    public void updateTechnology(Technology p) {
        this.technologyDAO.updateTechnology(p);
    }
 
    @Override
    @Transactional
    public List<Technology> listTechnology() {
        return this.technologyDAO.listTechnology();
    }
 
    @Override
    @Transactional
    public Technology getTechnologyById(int id) {
        return this.technologyDAO.getTechnologyById(id);
    }
 
    @Override
    @Transactional
    public void removeTechnology(int id) {
        this.technologyDAO.removeTechnology(id);
    }
}

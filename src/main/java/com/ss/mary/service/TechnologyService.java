/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ss.mary.service;

import java.util.List;
import com.ss.mary.model.Technology;

/**
 *
 * @author mbytsiv
 */
public interface TechnologyService {

    public void addTechnology(Technology p);

    public void updateTechnology(Technology p);

    public List<Technology> listTechnology();

    public Technology getTechnologyById(int id);

    public void removeTechnology(int id);
}

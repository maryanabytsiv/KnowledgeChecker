/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mary.controller;

/**
 *
 * @author mbytsiv
 */
import com.mary.model.Technology;
import com.mary.service.TechnologyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class TechnologyController {

    private TechnologyService technologyService;

    @Autowired(required = true)
    @Qualifier(value = "technologyService")
    public void setTechnologyService(TechnologyService ps) {
        this.technologyService = ps;
    }

    @RequestMapping(value = "/technology", method = RequestMethod.GET)
    public String listTechnologies(Model model) {
        model.addAttribute("technology", new Technology());
        model.addAttribute("listTechnologies", this.technologyService.listTechnology());
        return "technology";
    }

    //For add and update Technology both
    @RequestMapping(value = "/technology/add", method = RequestMethod.POST)
    public String addTechnology(@ModelAttribute("technology") Technology t) {

        if (t.getId() == 0) {
            //new Technology, add it
            this.technologyService.addTechnology(t);
        } else {
            //existing Technology, call update
            this.technologyService.updateTechnology(t);
        }

        return "redirect:/technology";

    }

    @RequestMapping("/remove/{id}")
    public String removeTechnology(@PathVariable("id") int id) {

        this.technologyService.removeTechnology(id);
        return "redirect:/technology";
    }

    @RequestMapping("/edit/{id}")
    public String editTechnology(@PathVariable("id") int id, Model model) {
        model.addAttribute("technology", this.technologyService.getTechnologyById(id));
        model.addAttribute("listTechnologies", this.technologyService.listTechnology());
        return "technology";
    }

}

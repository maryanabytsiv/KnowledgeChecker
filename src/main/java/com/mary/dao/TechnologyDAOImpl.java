/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mary.dao;

import com.mary.model.Technology;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author mbytsiv
 */
public class TechnologyDAOImpl implements TechnologyDao {

    private static final Logger logger = LoggerFactory.getLogger(TechnologyDAOImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    @Override
    public void addTechnology(Technology p) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(p);
        logger.info("Technology saved successfully, Technology Details=" + p);
    }

    @Override
    public void updateTechnology(Technology p) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(p);
        logger.info("Technology updated successfully, Technology Details=" + p);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Technology> listTechnology() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Technology> technologyList = session.createQuery("from Technology").list();
        for (Technology p : technologyList) {
            logger.info("Technology List::" + p);
        }
        return technologyList;
    }

    @Override
    public Technology getTechnologyById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Technology p = (Technology) session.load(Technology.class, new Integer(id));
        logger.info("Technology loaded successfully, Technology details=" + p);
        return p;
    }

    @Override
    public void removeTechnology(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Technology p = (Technology) session.load(Technology.class, new Integer(id));
        if (null != p) {
            session.delete(p);
        }
        logger.info("Technology deleted successfully, Technology details=" + p);
    }

}

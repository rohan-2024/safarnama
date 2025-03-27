/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.safarnama.dao;

import com.safarnama.entity.Vendor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author snghr
 */
public class VendorDao {
    
    private final SessionFactory factory;

    public VendorDao(SessionFactory factory) {
        this.factory=factory;
    }
    
    public boolean saveVendor(Vendor vendor){
        boolean flag=false;
        try{
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            session.save(vendor);
            tx.commit();
            session.close();
            flag=true;
        }catch(Exception e){
            flag=false;
            e.printStackTrace();
        }
        return flag;       
    }
    
    public Vendor getVendorByEmailandPassword(String email, String password){
        Vendor vendor=null;
        try{
            Session session=this.factory.openSession();
           Query q=session.createQuery("From Vendor as u where u.email=:email and u.password=:password");
           q.setParameter("email", email);
           q.setParameter("password", password);
           vendor=(Vendor)q.uniqueResult();
           session.close();
                   
        }catch(Exception e){
            e.printStackTrace();
        }
        return vendor;
    }

    public Vendor getVendorById(int vendorId) {
        Vendor vendor=null;
        try{
        Session session=this.factory.openSession();
        vendor=session.get(Vendor.class, vendorId);
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return vendor;
    }
    
    public void updateVendor(int vendorId,String password) {
        Vendor vendor=null;
        try{
        Session session=this.factory.openSession();
        Transaction tx=session.beginTransaction();
        vendor=session.get(Vendor.class, vendorId);
        vendor.setPassword(password);
        session.update(vendor);
        tx.commit();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

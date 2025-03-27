/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.safarnama.dao;

import com.safarnama.entity.Booking;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author snghr
 */
public class BookingDao {
    
    private final SessionFactory factory;

    public BookingDao(SessionFactory factory) {
        this.factory=factory;
    }
    
    public boolean saveBooking(Booking booking){
        boolean flag=false;
        try{
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            session.save(booking);
            tx.commit();
            flag=true;
        }catch(Exception e){
            flag=false;
            e.printStackTrace();
        }
        return flag;       
    }
    
    public void updateBooking(int id,String action,String data){
        try{
        Session session=this.factory.openSession();
        Transaction tx=session.beginTransaction();
        Booking b=session.get(Booking.class, id);
        if(action.equals("date")){
            b.setBookingDate(data);
        }else if(action.equals("status")){
            b.setBookingstatus(data);
            double deduct=(b.getAmount()*30)/100;
            b.setAmount(b.getAmount()-deduct);
            b.setPaymentStatus("Refund");
        }
        session.update(b);
        tx.commit();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public Booking getBookingById(String bookingId){
        Booking b=null;
        try{
        Session session=this.factory.openSession();
        Query q=session.createQuery("FROM Booking as b where b.bookingId=:bookingId");
        q.setParameter("bookingId", bookingId);
        b=(Booking)q.uniqueResult();
        session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return b;
    }
    
    
    public int getLastId(){
        int id=0;
        Session session=this.factory.openSession();
        Query q=session.createQuery("SELECT coalesce(max(i.id), 0) FROM Booking i");
        id=(int)q.uniqueResult();
        return id;
    }

    public List<Booking> getBookingByVendor(){
       List<Booking> list=null;
       try{
           Session session=this.factory.openSession();
           Query q=session.createQuery("from Booking");
           list=q.list();
           session.close();
       }catch(Exception e){
           e.printStackTrace();
       }
       return list;
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.safarnama.dao;

import com.safarnama.entity.Vehicle;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author snghr
 */
public class VehicleDao {
    
    private final SessionFactory factory;

    public VehicleDao(SessionFactory factory) {
        this.factory=factory;
    }
    
    public boolean saveVehicle(Vehicle vehicle){
        boolean flag=false;
        try{
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            session.save(vehicle);
            tx.commit();
            session.close();
            flag=true;
        }catch(Exception e){
            flag=false;
            e.printStackTrace();
        }
        return flag;       
    }

    public void updateVehicle(int vehicleId, String description, String facilities, double price, String status) {
         try{
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Vehicle vehicle=session.get(Vehicle.class, vehicleId);
            vehicle.setDescription(description);
            vehicle.setFacilities(facilities);
            vehicle.setPrice(price);
            vehicle.setStatus(status);
            session.update(vehicle);
            tx.commit();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
  public List<Vehicle> getAllVehicleByVendorID(int vendorId) {
      List<Vehicle> list=null;
         try{
            Session session=this.factory.openSession();
            Query q=session.createQuery("FROM Vehicle as v WHERE v.vendorId=:vendorId");
            q.setParameter("vendorId", vendorId);
            list=q.list();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
         return list;
    }
    
   public List<Vehicle> getAllVehicles() {
      List<Vehicle> list=null;
         try{
            Session session=this.factory.openSession();
            Query q=session.createQuery("FROM Vehicle");
            list=q.list();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
         return list;
    }
    
   public Vehicle getVehicleById(int vehicleId) {
      Vehicle vehicle=null;
         try{
            Session session=this.factory.openSession();
            vehicle=session.get(Vehicle.class, vehicleId);
            session.close();
        }catch(Exception e){
            e.printStackTrace();
        }
         return vehicle;
    }
    
  
}

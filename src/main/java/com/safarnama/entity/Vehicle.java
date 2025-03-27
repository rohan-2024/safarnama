/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.safarnama.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

/**
 *
 * @author snghr
 */
@Entity
public class Vehicle {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private int vendorId;
    private String vehicleName;
    private String vehicleCategory;
    private String vehiclePlate;
    private String description;
    private boolean AC;
    private String facilities;
    private int seats;
    private double price;
    private String status;
    private String photo;
    
    public Vehicle() {
    }

    public Vehicle(int vendorId, String vehicleName, String vehicleCategory, String vehiclePlate, String description, boolean AC, String facilities, int seats, double price, String status, String photo) {
        this.vendorId = vendorId;
        this.vehicleName = vehicleName;
        this.vehicleCategory = vehicleCategory;
        this.vehiclePlate = vehiclePlate;
        this.description = description;
        this.AC = AC;
        this.facilities = facilities;
        this.seats = seats;
        this.price = price;
        this.status = status;
        this.photo = photo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public String getVehicleName() {
        return vehicleName;
    }

    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }

    public String getVehicleCategory() {
        return vehicleCategory;
    }

    public void setVehicleCategory(String vehicleCategory) {
        this.vehicleCategory = vehicleCategory;
    }

    public String getVehiclePlate() {
        return vehiclePlate;
    }

    public void setVehiclePlate(String vehiclePlate) {
        this.vehiclePlate = vehiclePlate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isAC() {
        return AC;
    }

    public void setAC(boolean AC) {
        this.AC = AC;
    }

    public String getFacilities() {
        return facilities;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

   
    @Override
    public String toString() {
        return "Vehicle{" + "id=" + id + ", vendorId=" + vendorId + ", vehicleName=" + vehicleName + ", vehicleCategory=" + vehicleCategory + ", vehiclePlate=" + vehiclePlate + ", description=" + description + ", AC=" + AC + ", facilities=" + facilities + ", seats=" + seats + ", price=" + price + ", status=" + status + ", photo=" + photo + '}';
    }

}

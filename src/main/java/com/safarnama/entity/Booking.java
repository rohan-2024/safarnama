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
public class Booking {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String bookingId;
    private int vehicleId;
    private String customerName;
    private String cutomerContact;
    private String customerEmail;
    private String pickUp;
    private String dropOff;
    private String pickupDate;
    private String bookingDate;
    private String bookingstatus;
    private int bookingDays;
    private double amount;
    private String paymentStatus;
    private String requests;
    
    public Booking() {
    }

    public Booking(String bookingId, int vehicleId, String customerName, String cutomerContact, String customerEmail, String pickUp, String dropOff, String pickupDate, String bookingDate, String bookingstatus, int bookingDays, double amount, String paymentStatus, String requests) {
        this.bookingId = bookingId;
        this.vehicleId=vehicleId;
        this.customerName = customerName;
        this.cutomerContact = cutomerContact;
        this.customerEmail = customerEmail;
        this.pickUp = pickUp;
        this.dropOff = dropOff;
        this.pickupDate = pickupDate;
        this.bookingDate = bookingDate;
        this.bookingstatus = bookingstatus;
        this.bookingDays = bookingDays;
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.requests = requests;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }
    
    
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCutomerContact() {
        return cutomerContact;
    }

    public void setCutomerContact(String cutomerContact) {
        this.cutomerContact = cutomerContact;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getPickUp() {
        return pickUp;
    }

    public void setPickUp(String pickUp) {
        this.pickUp = pickUp;
    }

    public String getDropOff() {
        return dropOff;
    }

    public void setDropOff(String dropOff) {
        this.dropOff = dropOff;
    }

    public String getPickupDate() {
        return pickupDate;
    }

    public void setPickupDate(String pickupDate) {
        this.pickupDate = pickupDate;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingstatus() {
        return bookingstatus;
    }

    public void setBookingstatus(String bookingstatus) {
        this.bookingstatus = bookingstatus;
    }

    public int getBookingDays() {
        return bookingDays;
    }

    public void setBookingDays(int bookingDays) {
        this.bookingDays = bookingDays;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getRequests() {
        return requests;
    }

    public void setRequests(String requests) {
        this.requests = requests;
    }

    @Override
    public String toString() {
        return "Booking{" + "id=" + id + ", bookingId=" + bookingId + ", vehicleId=" + vehicleId + ", customerName=" + customerName + ", cutomerContact=" + cutomerContact + ", customerEmail=" + customerEmail + ", pickUp=" + pickUp + ", dropOff=" + dropOff + ", pickupDate=" + pickupDate + ", bookingDate=" + bookingDate + ", bookingstatus=" + bookingstatus + ", bookingDays=" + bookingDays + ", amount=" + amount + ", paymentStatus=" + paymentStatus + ", requests=" + requests + '}';
    }

}

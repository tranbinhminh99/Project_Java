/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author tranb
 */
public class Cancellation {

    int canceID;
    Booking b;
    Date checkIn;
    Date checkOut;
    Hotel h;
    Room r;
    Account a;
    String reasonCance;
    Date bookTime;
    Date canceTime;

    public int getCanceID() {
        return canceID;
    }

    public void setCanceID(int canceID) {
        this.canceID = canceID;
    }

    public Booking getB() {
        return b;
    }

    public void setB(Booking b) {
        this.b = b;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public Hotel getH() {
        return h;
    }

    public void setH(Hotel h) {
        this.h = h;
    }

    public Room getR() {
        return r;
    }

    public void setR(Room r) {
        this.r = r;
    }

    public Account getA() {
        return a;
    }

    public void setA(Account a) {
        this.a = a;
    }

    public String getReasonCance() {
        return reasonCance;
    }

    public void setReasonCance(String reasonCance) {
        this.reasonCance = reasonCance;
    }

    public Date getBookTime() {
        return bookTime;
    }

    public void setBookTime(Date bookTime) {
        this.bookTime = bookTime;
    }

    public Date getCanceTime() {
        return canceTime;
    }

    public void setCanceTime(Date canceTime) {
        this.canceTime = canceTime;
    }

}

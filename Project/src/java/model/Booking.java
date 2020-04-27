/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.SimpleDateFormat;
import java.sql.Date;

/**
 *
 * @author tranb
 */
public class Booking {

    int BookingID;
    Date checkIn;
    Date checkOut;
    Hotel h;
    Room r;
    Account a;
    String comment;
    Date bookTime;

   

    public int getBookingID() {
        return BookingID;
    }

    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getBookTime() {
        return bookTime;
    }

    public void setBookTime(Date bookTime) {
        this.bookTime = bookTime;
    }

}

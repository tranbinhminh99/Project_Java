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
public class PayMents {

    int payMentID;
    Booking b;
    Date payTime;
    float price;

    public Booking getB() {
        return b;
    }

    public void setB(Booking b) {
        this.b = b;
    }

    public int getPayMentID() {
        return payMentID;
    }

    public void setPayMentID(int payMentID) {
        this.payMentID = payMentID;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

}

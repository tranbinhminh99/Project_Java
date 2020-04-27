/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tranb
 */
public class Room {

    int roomID;
    String roomType;
    float priceFerNight;
    int maxPerson;
    boolean isFree;
    Hotel h;

    public Hotel getH() {
        return h;
    }

    public void setH(Hotel h) {
        this.h = h;
    }
    

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public float getPriceFerNight() {
        return priceFerNight;
    }

    public void setPriceFerNight(float priceFerNight) {
        this.priceFerNight = priceFerNight;
    }

    public int getMaxPerson() {
        return maxPerson;
    }

    public void setMaxPerson(int maxPerson) {
        this.maxPerson = maxPerson;
    }

    public boolean isIsFree() {
        return isFree;
    }

    public void setIsFree(boolean isFree) {
        this.isFree = isFree;
    }

}

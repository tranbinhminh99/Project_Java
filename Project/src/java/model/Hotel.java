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
public class Hotel {
    int hotelID;
    Place p;
    String descride;
    String hotelName;
    String urlImage;

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }
    

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    public Place getP() {
        return p;
    }

    public void setP(Place p) {
        this.p = p;
    }

    public String getDescride() {
        return descride;
    }

    public void setDescride(String descride) {
        this.descride = descride;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }
    
    
}

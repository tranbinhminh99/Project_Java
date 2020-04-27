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
public class Admin_Hotel {

    int adminHotelID;
    Hotel h;
    String userName;
    String passWord;
    String nameAdmin;

    public int getAdminHotelID() {
        return adminHotelID;
    }

    public void setAdminHotelID(int adminHotelID) {
        this.adminHotelID = adminHotelID;
    }

    public Hotel getH() {
        return h;
    }

    public void setH(Hotel h) {
        this.h = h;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getNameAdmin() {
        return nameAdmin;
    }

    public void setNameAdmin(String nameAdmin) {
        this.nameAdmin = nameAdmin;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dal.AccountDAO;
import dal.Account_HotelDAO;
import dal.BookingDAO;
import dal.HotelDAO;
import dal.PlaceDAO;
import dal.RoomDAO;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Account;
import model.Admin_Hotel;
import model.Booking;
import model.Hotel;
import model.Place;
import model.Room;

/**
 *
 * @author tranb
 */
public class Main {
//    public static void main(String[] args) {
////        AccountDAO ac = new AccountDAO();
////        ArrayList<Account> aa  = new ArrayList<>();
////        aa = ac.getAccount();
////        System.out.println(aa.get(0).getPassWord());
//
//          HotelDAO h = new HotelDAO();
//          ArrayList<Hotel> ab = h.getHotelsByPlace("h");
//          for (Hotel hotel : ab) {
//              System.out.println(hotel.getUrlImage());
//        }
//        
//    }

    public static void main(String[] args) {
//        PlaceDAO pd = new PlaceDAO();
//        ArrayList<Place> places = pd.getPlaces();
//        System.out.println(places.get(0).getAddressPlace());
//        RoomDAO rd = new RoomDAO();
//        Room r = rd.getRoom(2);
//        System.out.println(r.getH().getUrlImage());
//        BookingDAO bd = new BookingDAO();
//        int day = bd.dayNumber(32);
//        System.out.println(day);
//        
//        Booking b = bd.getBookingByID(43);
//        
//        System.out.println(b.getBookTime());
//        HotelDAO hd = new HotelDAO();
//        String a = hd.getHotelByAVG(1000000, 1300000);
//          System.out.println(a);
//
//        ArrayList<Hotel> hotelsHLB = hd.getHotelsByPlace("hcb", "-1");
//        if (hotelsHLB.isEmpty()) {
//            System.out.println("haha");
//        } else {
//            System.out.println(hotelsHLB.get(1).getHotelName());
//        }
//            BookingDAO bd = new BookingDAO();
//            ArrayList<Booking> bookL = bd.getBookingDetail(3);
//            System.out.println(bookL.get(0).getH().getHotelName());
//        Account_HotelDAO ahd = new Account_HotelDAO();
//        Admin_Hotel a = ahd.getAdmin_HotelsByUser("admin1");
//        System.out.println(a.getPassWord());
        BookingDAO bd = new BookingDAO();
        ArrayList<Booking> BookL = bd.getBookingDT(9);
        System.out.println(BookL.get(0).getH().getHotelName());
    }
}

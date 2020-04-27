/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Hotel;
import model.Place;

/**
 *
 * @author tranb
 */
public class HotelDAO extends DBContext {

    public ArrayList<Hotel> getHotels() {
        ArrayList<Hotel> hotels = new ArrayList<>();
        try {
            String sql = "SELECT Hotel.HotelID, Hotel.PlaceID, Hotel.HotelName, Hotel.Descride, Place.AddressPlace,Hotel.images\n"
                    + "                    FROM     Hotel INNER JOIN\n"
                    + "                                     Place ON Hotel.PlaceID = Place.PlaceID";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setHotelID(rs.getInt("HotelID"));
                h.setHotelName(rs.getString("HotelName"));
                h.setDescride(rs.getString("Descride"));
                h.setUrlImage(rs.getString("images"));
                Place p = new Place();
                p.setPlaceID(rs.getInt("PlaceID"));
                p.setAddressPlace(rs.getString("AddressPlace"));
                h.setP(p);
                hotels.add(h);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlaceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hotels;
    }

    public ArrayList<Hotel> getHotelsByPlace(String place, String avg) {
        ArrayList<Hotel> hotels = new ArrayList<>();
        try {
            String sql = "SELECT Hotel.HotelID, Hotel.PlaceID, Hotel.HotelName, Hotel.Descride, Place.AddressPlace,Hotel.images\n"
                    + "                    FROM     Hotel INNER JOIN\n"
                    + "                                      Place ON Hotel.PlaceID = Place.PlaceID\n"
                    + "                    				  where AddressPlace like '%" + place + "%'";
            if(!avg.equals("")){
                sql = sql +" and Hotel.HotelID in ("+avg+")";
            }
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setHotelID(rs.getInt("HotelID"));
                h.setHotelName(rs.getString("HotelName"));
                h.setDescride(rs.getString("Descride"));
                h.setUrlImage(rs.getString("images"));
                Place p = new Place();
                p.setPlaceID(rs.getInt("PlaceID"));
                p.setAddressPlace(rs.getString("AddressPlace"));
                h.setP(p);
                hotels.add(h);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlaceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hotels;
    }

    public String getHotelByAVG(float min, float max) {
        String a = "";
        try {
            String sql = "SELECT Hotel.HotelID,avg (Room.PricePerNight) as roomN\n"
                    + "FROM     Hotel INNER JOIN\n"
                    + "                  Room ON Hotel.HotelID = Room.HotelID\n"
                    + "				  group by Hotel.HotelID\n"
                    + "				  having avg (Room.PricePerNight) > " + min + " and avg (Room.PricePerNight) < " + max;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                a = a + rs.getInt("HotelID") + ",";
            }
        } catch (SQLException ex) {
            Logger.getLogger(HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public Hotel getHotelsByID(int id) {

        try {
            String sql = "SELECT Hotel.HotelID, Hotel.PlaceID, Hotel.HotelName, Hotel.Descride, Place.AddressPlace,Hotel.images\n"
                    + "FROM     Hotel INNER JOIN\n"
                    + "                  Place ON Hotel.PlaceID = Place.PlaceID\n"
                    + "				  where HotelID =" + id;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Hotel h = new Hotel();
                h.setHotelID(rs.getInt("HotelID"));
                h.setHotelName(rs.getString("HotelName"));
                h.setDescride(rs.getString("Descride"));
                h.setUrlImage(rs.getString("images"));
                Place p = new Place();
                p.setPlaceID(rs.getInt("PlaceID"));
                p.setAddressPlace(rs.getString("AddressPlace"));
                h.setP(p);
                return h;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlaceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Hotel;
import model.Place;
import model.Room;

/**
 *
 * @author tranb
 */
public class RoomDAO extends DBContext {
    
    public ArrayList<Room> getRooms(int hid) {
        ArrayList<Room> getRooms = new ArrayList<>();
        try {
            String sql = "SELECT Room.RoomNumber, Room.RoomType, Room.PricePerNight, Room.MaxPerson, Room.IsFree, Hotel.HotelID\n"
                    + "FROM     Hotel INNER JOIN\n"
                    + "                  Room ON Hotel.HotelID = Room.HotelID\n"
                    + "\n"
                    + "				  where Hotel.HotelID = " + hid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setRoomID(rs.getInt("RoomNumber"));
                r.setRoomType(rs.getString("RoomType"));
                r.setPriceFerNight(rs.getFloat("PricePerNight"));
                r.setMaxPerson(rs.getInt("MaxPerson"));
                r.setIsFree(rs.getBoolean("IsFree"));
                Hotel h = new Hotel();
                h.setHotelID(hid);
                r.setH(h);
                getRooms.add(r);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return getRooms;
    }
    HotelDAO hd = new HotelDAO();
    
    public Room getRoom(int rid) {
        
        try {
            String sql = "SELECT RoomNumber, RoomType, PricePerNight, MaxPerson, IsFree, HotelID\n"
                    + "FROM     Room\n"
                    + "where RoomNumber = " + rid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setRoomID(rs.getInt("RoomNumber"));
                r.setRoomType(rs.getString("RoomType"));
                r.setPriceFerNight(rs.getFloat("PricePerNight"));
                r.setMaxPerson(rs.getInt("MaxPerson"));
                r.setIsFree(rs.getBoolean("IsFree"));
                Hotel h = hd.getHotelsByID(rs.getInt("HotelID"));
                r.setH(h);
                return r;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void updateRoomFree(int rid, int flaq) {
        try {
            String sql = "UPDATE [dbo].[Room]\n"
                    + "   SET      [IsFree] = \n" + flaq
                    + " WHERE RoomNumber = " + rid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Room> getRoombusy() {
        ArrayList<Room> roomlist = new ArrayList<>();
        try {
            String sql = "SELECT [RoomNumber]\n"
                    + "      ,[RoomType]\n"
                    + "      ,[PricePerNight]\n"
                    + "      ,[MaxPerson]\n"
                    + "      ,[IsFree]\n"
                    + "      ,[HotelID]\n"
                    + "  FROM [Project_Booking].[dbo].[Room] where IsFree = 0";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                Hotel h = hd.getHotelsByID(rs.getInt("HotelID"));
                r.setH(h);
                r.setRoomType(rs.getString("RoomType"));
                r.setRoomID(rs.getInt("RoomNumber"));
                r.setPriceFerNight(rs.getFloat("PricePerNight"));
                r.setMaxPerson(rs.getInt("MaxPerson"));
                r.setIsFree(rs.getBoolean("IsFree"));
                roomlist.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roomlist;
    }
}

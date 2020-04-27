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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Booking;
import model.Hotel;
import model.Place;
import model.Room;

/**
 *
 * @author tranb
 */
public class BookingDAO extends DBContext {

    public int dayNumber(int bid) {
        try {
            String sql = "SELECT BookingID, DATEDIFF(day,CheckIn, CheckOut) as ngay\n"
                    + "FROM     Booking\n"
                    + "where BookingID = " + bid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int a = rs.getInt("ngay");
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int BookingID() {
        try {
            String sql = "SELECT top 1 BookingID\n"
                    + "FROM     Booking\n"
                    + "order by BookingID DESC";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int a = rs.getInt("BookingID");
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;

    }

    public void insertOrder(Booking a) {
        try {
            String sql = "INSERT INTO [dbo].[Booking]\n"
                    + "           ([CheckIn]\n"
                    + "           ,[CheckOut]\n"
                    + "           ,[HotelsID]\n"
                    + "           ,[RoomNumber]\n"
                    + "           ,[CustomerID]\n"
                    + "           ,[Comment]\n"
                    + "           ,[BookTime])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDate(1, a.getCheckIn());
            statement.setDate(2, a.getCheckOut());
            statement.setInt(3, a.getR().getH().getHotelID());
            statement.setInt(4, a.getR().getRoomID());
            statement.setInt(5, a.getA().getID());
            statement.setString(6, a.getComment());
            statement.setDate(7, a.getBookTime());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    HotelDAO hd = new HotelDAO();
    RoomDAO rd = new RoomDAO();
    AccountDAO ad = new AccountDAO();

    public ArrayList<Booking> getBooking() {
        ArrayList<Booking> getBook = new ArrayList<>();
        try {
            String sql = "SELECT [BookingID]\n"
                    + "      ,[CheckIn]\n"
                    + "      ,[CheckOut]\n"
                    + "      ,[HotelsID]\n"
                    + "      ,[RoomNumber]\n"
                    + "      ,[CustomerID]\n"
                    + "      ,[Comment]\n"
                    + "      ,[BookTime]\n"
                    + "  FROM [dbo].[Booking]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingID(rs.getInt("BookingID"));
                b.setCheckIn(rs.getDate("CheckIn"));
                b.setCheckOut(rs.getDate("CheckOut"));
                Hotel h = hd.getHotelsByID(rs.getInt("HotelsID"));
                Room r = rd.getRoom(rs.getInt("RoomNumber"));
                Account a = ad.getAccountByID(rs.getInt("CustomerID"));
                b.setH(h);
                b.setR(r);
                b.setA(a);
                b.setComment(rs.getString("Comment"));
                b.setBookTime(rs.getDate("BookTime"));
                getBook.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return getBook;
    }

    public ArrayList<Booking> getBookingDetail(int cid) {
        ArrayList<Booking> bookL = new ArrayList<>();
        try {
            String sql = "SELECT Booking.BookingID, Booking.CheckIn, Booking.CheckOut, Booking.HotelsID, Booking.CustomerID, Booking.RoomNumber, Booking.Comment, Booking.BookTime, Room.IsFree\n"
                    + "FROM     Booking INNER JOIN\n"
                    + "                  Room ON Booking.RoomNumber = Room.RoomNumber INNER JOIN\n"
                    + "                  PayMents ON Booking.BookingID = PayMents.BookingID"
                    + "				  where Booking.CustomerID = " + cid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingID(rs.getInt("BookingID"));
                b.setCheckIn(rs.getDate("CheckIn"));
                b.setCheckOut(rs.getDate("CheckOut"));
                Hotel h = hd.getHotelsByID(rs.getInt("HotelsID"));
                Room r = rd.getRoom(rs.getInt("RoomNumber"));
                Account a = ad.getAccountByID(rs.getInt("CustomerID"));
                b.setH(h);
                b.setR(r);
                b.setA(a);
                b.setComment(rs.getString("Comment"));
                b.setBookTime(rs.getDate("BookTime"));
                bookL.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookL;
    }

    public Booking getBookingByID(int bid) {
        try {
            String sql = "SELECT [BookingID]\n"
                    + "      ,[CheckIn]\n"
                    + "      ,[CheckOut]\n"
                    + "      ,[HotelsID]\n"
                    + "      ,[RoomNumber]\n"
                    + "      ,[CustomerID]\n"
                    + "      ,[Comment]\n"
                    + "      ,[BookTime]\n"
                    + "  FROM [dbo].[Booking] where BookingID =" + bid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingID(rs.getInt("BookingID"));
                b.setCheckIn(rs.getDate("CheckIn"));
                b.setCheckOut(rs.getDate("CheckOut"));
                Hotel h = hd.getHotelsByID(rs.getInt("HotelsID"));
                Room r = rd.getRoom(rs.getInt("RoomNumber"));
                Account a = ad.getAccountByID(rs.getInt("CustomerID"));
                b.setH(h);
                b.setR(r);
                b.setA(a);
                b.setComment(rs.getString("Comment"));
                b.setBookTime(rs.getDate("BookTime"));
                return b;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Booking getBookBusy(int rid) {
        try {
            String sql = "SELECT top 1 Booking.BookingID, Booking.CheckIn, Booking.CheckOut, Booking.HotelsID, Booking.RoomNumber, Booking.CustomerID, Booking.Comment, Booking.BookTime\n"
                    + "FROM     Booking INNER JOIN\n"
                    + "                  Room ON Booking.RoomNumber = Room.RoomNumber\n"
                    + "				  where Room.IsFree = 0 and Booking.RoomNumber = " + rid + "\n"
                    + "				  order by  Booking.BookingID DESC";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setA(ad.getAccountByID(rs.getInt("CustomerID")));
                b.setBookTime(rs.getDate("BookTime"));
                b.setBookingID(rs.getInt("BookingID"));
                b.setCheckIn(rs.getDate("CheckIn"));
                b.setCheckOut(rs.getDate("CheckOut"));
                b.setComment(rs.getString("Comment"));
                b.setH(hd.getHotelsByID(rs.getInt("HotelsID")));
                b.setR(rd.getRoom(rs.getInt("RoomNumber")));
                return b;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Booking> getBookingDT(int hid) {
        ArrayList<Booking> bookL = new ArrayList<>();
        try {
            String sql = "SELECT Booking.*\n"
                    + "FROM     PayMents INNER JOIN\n"
                    + "                  Booking ON PayMents.BookingID = Booking.BookingID INNER JOIN\n"
                    + "                  Hotel ON Booking.HotelsID = Hotel.HotelID INNER JOIN\n"
                    + "                  Admin_Hotel ON Hotel.HotelID = Admin_Hotel.HotelID\n"
                    + "				  where Hotel.HotelID = " + hid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingID(rs.getInt("BookingID"));
                b.setCheckIn(rs.getDate("CheckIn"));
                b.setCheckOut(rs.getDate("CheckOut"));
                Hotel h = hd.getHotelsByID(rs.getInt("HotelsID"));
                Room r = rd.getRoom(rs.getInt("RoomNumber"));
                Account a = ad.getAccountByID(rs.getInt("CustomerID"));
                b.setH(h);
                b.setR(r);
                b.setA(a);
                b.setComment(rs.getString("Comment"));
                b.setBookTime(rs.getDate("BookTime"));
                bookL.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookL;
    }

}

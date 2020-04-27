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
import model.Admin_Hotel;

/**
 *
 * @author tranb
 */
public class Account_HotelDAO extends DBContext {

    HotelDAO hd = new HotelDAO();

    public ArrayList<Admin_Hotel> getAdmin_Hotels() {
        ArrayList<Admin_Hotel> ad_hotelL = new ArrayList<>();
        try {
            String sql = "SELECT [AdminHotelID]\n"
                    + "      ,[HotelID]\n"
                    + "      ,[UserName]\n"
                    + "      ,[PassWord]\n"
                    + "      ,[Name_Admin]\n"
                    + "  FROM [dbo].[Admin_Hotel]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Admin_Hotel ad = new Admin_Hotel();
                ad.setH(hd.getHotelsByID(rs.getInt("HotelID")));
                ad.setAdminHotelID(rs.getInt("AdminHotelID"));
                ad.setNameAdmin(rs.getString("Name_Admin"));
                ad.setUserName(rs.getString("UserName"));
                ad.setPassWord(rs.getString("PassWord"));
                ad_hotelL.add(ad);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account_HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ad_hotelL;
    }

    public Admin_Hotel getAdmin_HotelsByUser(String User) {
        try {
            String sql = "SELECT [AdminHotelID]\n"
                    + "      ,[HotelID]\n"
                    + "      ,[UserName]\n"
                    + "      ,[PassWord]\n"
                    + "      ,[Name_Admin]\n"
                    + "  FROM [dbo].[Admin_Hotel] where UserName = '"+User+"'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Admin_Hotel ad = new Admin_Hotel();
                ad.setH(hd.getHotelsByID(rs.getInt("HotelID")));
                ad.setAdminHotelID(rs.getInt("AdminHotelID"));
                ad.setNameAdmin(rs.getString("Name_Admin"));
                ad.setUserName(rs.getString("UserName"));
                ad.setPassWord(rs.getString("PassWord"));
                return ad;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account_HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PayMents;

/**
 *
 * @author tranb
 */
public class PayMentDAO extends DBContext {

    public void insertPayMent(PayMents p) {
        try {
            String sql = "INSERT INTO [dbo].[PayMents]\n"
                    + "           ([BookingID]\n"
                    + "           ,[PayTime]\n"
                    + "           ,[Price])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, p.getB().getBookingID());
            statement.setDate(2, p.getPayTime());
            statement.setFloat(3, p.getPrice());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PayMentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}

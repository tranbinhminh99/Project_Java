/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cancellation;

/**
 *
 * @author tranb
 */
public class CancellationDAO  extends DBContext {

    public void insertCancel(Cancellation c) {
        try {
            String sql = "INSERT INTO [dbo].[Cancellation]\n"
                    + "           ([BookingID]\n"
                    + "           ,[CheckIn]\n"
                    + "           ,[CheckOut]\n"
                    + "           ,[HotelsID]\n"
                    + "           ,[RoomNumber]\n"
                    + "           ,[CustomerID]\n"
                    + "           ,[ReasonCance]\n"
                    + "           ,[BookTime]\n"
                    + "           ,[CanceTime])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, c.getB().getBookingID());
            statement.setDate(2, c.getB().getCheckIn());
            statement.setDate(3, c.getCheckOut());
            statement.setInt(4, c.getH().getHotelID());
            statement.setInt(5, c.getR().getRoomID());
            statement.setInt(6, c.getA().getID());
            statement.setString(7, c.getReasonCance());
            statement.setDate(8, c.getBookTime());
            statement.setDate(9, c.getCanceTime());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CancellationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    
}

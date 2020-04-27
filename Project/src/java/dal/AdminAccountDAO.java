/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account_Admin;

/**
 *
 * @author tranb
 */
public class AdminAccountDAO extends DBContext {

    public Account_Admin getAdminAcc(String userName) {
        try {
            String sql = "SELECT [AdminID]\n"
                    + "      ,[UserName]\n"
                    + "      ,[PassWord]\n"
                    + "  FROM [Project_Booking].[dbo].[AccountAdmin] where [UserName] = '" + userName + "'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account_Admin a = new Account_Admin();
                a.setAdminID(rs.getInt("AdminID"));
                a.setUserName(userName);
                a.setPassword(rs.getString("PassWord"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminAccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

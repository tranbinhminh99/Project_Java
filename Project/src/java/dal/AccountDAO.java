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
import model.Account;

/**
 *
 * @author tranb
 */
public class AccountDAO extends DBContext {

    public ArrayList<Account> getAccount() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT [CustomerID]\n"
                    + "      ,[FullName]\n"
                    + "      ,[Address]\n"
                    + "      ,[PhoneNumber]\n"
                    + "      ,[BirthDay]\n"
                    + "      ,[UserName]\n"
                    + "      ,[Password]\n"
                    + "  FROM [dbo].[Account]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setID(rs.getInt("CustomerID"));
                a.setFullName(rs.getString("FullName"));
                a.setAddress(rs.getString("Address"));
                a.setPhoneNumber(rs.getString("PhoneNumber"));
                a.setBirthDay(rs.getDate("BirthDay"));
                a.setUserName(rs.getString("UserName"));
                a.setPassWord(rs.getString("Password"));
                accounts.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public Account getAccountByID(int aid) {

        try {
            String sql = "SELECT [CustomerID]\n"
                    + "      ,[FullName]\n"
                    + "      ,[Address]\n"
                    + "      ,[PhoneNumber]\n"
                    + "      ,[BirthDay]\n"
                    + "      ,[UserName]\n"
                    + "      ,[Password]\n"
                    + "  FROM [dbo].[Account] where CustomerID = " + aid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setID(rs.getInt("CustomerID"));
                a.setFullName(rs.getString("FullName"));
                a.setAddress(rs.getString("Address"));
                a.setPhoneNumber(rs.getString("PhoneNumber"));
                a.setBirthDay(rs.getDate("BirthDay"));
                a.setUserName(rs.getString("UserName"));
                a.setPassWord(rs.getString("Password"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertAccount(Account a) {
        try {
            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([FullName]\n"
                    + "           ,[Address]\n"
                    + "           ,[PhoneNumber]\n"
                    + "           ,[BirthDay]\n"
                    + "           ,[UserName]\n"
                    + "           ,[Password])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, a.getFullName());
            statement.setString(2, a.getAddress());
            statement.setString(3, a.getPhoneNumber());
            statement.setDate(4, a.getBirthDay());
            statement.setString(5, a.getUserName());
            statement.setString(6, a.getPassWord());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

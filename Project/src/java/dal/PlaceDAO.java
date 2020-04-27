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
import model.Place;

/**
 *
 * @author tranb
 */
public class PlaceDAO extends DBContext {

    public ArrayList<Place> getPlaces() {
        ArrayList<Place> places = new ArrayList<>();
        try {
            String sql = "SELECT [PlaceID]\n"
                    + "      ,[AddressPlace]\n"
                    + "  FROM [dbo].[Place]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Place p = new Place();
                p.setPlaceID(rs.getInt("PlaceID"));
                p.setAddressPlace(rs.getString("AddressPlace"));
                places.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlaceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return places;
    }
}

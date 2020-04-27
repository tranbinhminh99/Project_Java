/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.HotelDAO;
import dal.PlaceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Hotel;
import model.Place;

/**
 *
 * @author tranb
 */
public class HotelsSearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HotelDAO hd = new HotelDAO();

        String value = request.getParameter("search");
        if (value == null) {
            value = "";
        }

        if (value.equals("All properties")) {
            value = "";
        }

        request.setAttribute("value", value);
        String avg = request.getParameter("valueAVG");
        ArrayList<Hotel> hotels = null;
        if (avg == null) {
            hotels = hd.getHotelsByPlace(value, "");
        } else {
            request.setAttribute("AVG", avg);
            if (avg.equals("-1")) {
                hotels = hd.getHotelsByPlace(value, "");
            } else {
                String[] aa = avg.split("-");
                avg = hd.getHotelByAVG(Float.parseFloat(aa[0]), Float.parseFloat(aa[1]));
                if (avg.equals("")) {
                    avg = "-1";
                    hotels = hd.getHotelsByPlace(value, avg);
                } else {
                    hotels = hd.getHotelsByPlace(value, avg.substring(0, avg.length() - 1));
                }
            }
        }
        request.setAttribute("hotels", hotels);
        request.getRequestDispatcher("search.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

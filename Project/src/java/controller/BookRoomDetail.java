/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BookingDAO;
import dal.RoomDAO;
import java.awt.print.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Booking;
import model.Room;

/**
 *
 * @author tranb
 */
public class BookRoomDetail extends HttpServlet {

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
        long millis = System.currentTimeMillis();
        Date bookTime = new Date(millis);
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");
        String rid = request.getParameter("roomid");
        String textarea = request.getParameter("textarea");
        if (textarea == null) {
            textarea = "";
        }

        Account a = (Account) request.getSession().getAttribute("accountLogin");
        BookingDAO bd = new BookingDAO();
        RoomDAO rd = new RoomDAO();
        if (dateFrom != null && dateTo != null && rid != null && a != null) {
            Room r = rd.getRoom(Integer.parseInt(rid));
            Booking b = new Booking();
            b.setA(a);
            b.setBookTime(bookTime);
            b.setCheckIn(Date.valueOf(dateFrom));
            b.setCheckOut(Date.valueOf(dateTo));
            b.setComment(textarea);
            b.setR(r);
            bd.insertOrder(b);
            rd.updateRoomFree(Integer.parseInt(rid), 0);
            
            int bid = bd.BookingID();
            int day = bd.dayNumber(bid);
            request.setAttribute("bid", bid);
            request.setAttribute("day", day);
            request.setAttribute("booking", b);
        }

        request.getRequestDispatcher("bookDetail.jsp").forward(request, response);
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

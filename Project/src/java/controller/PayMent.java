/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BookingDAO;
import dal.CancellationDAO;
import dal.PayMentDAO;
import dal.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Booking;
import model.Cancellation;
import model.Hotel;
import model.PayMents;

/**
 *
 * @author tranb
 */
public class PayMent extends HttpServlet {

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

        String bidPayMent = request.getParameter("payment");
        String bidCancel = request.getParameter("cancel");
        String price = request.getParameter("price");
        String reason = request.getParameter("textarea");
        if (reason == null) {
            reason = "";
        }
        long millis = System.currentTimeMillis();
        Date payTime = new Date(millis);

        BookingDAO bd = new BookingDAO();
        PayMentDAO pd = new PayMentDAO();
        if (bidPayMent != null && price != null) {
            Booking b = bd.getBookingByID(Integer.parseInt(bidPayMent));
            PayMents p = new PayMents();
            p.setB(b);
            p.setPayTime(payTime);
            p.setPrice(Float.parseFloat(price));
            pd.insertPayMent(p);
            boolean flaq = true;
            request.setAttribute("flaq", flaq);
            request.getRequestDispatcher("finish.jsp").forward(request, response);
        }
        RoomDAO rd = new RoomDAO();
        CancellationDAO cd = new CancellationDAO();
        if (bidCancel != null) {
            Booking b = bd.getBookingByID(Integer.parseInt(bidCancel));
            Cancellation c = new Cancellation();
            c.setA(b.getA());
            c.setB(b);
            c.setH(b.getH());
            c.setBookTime(b.getBookTime());
            c.setCanceTime(payTime);
            c.setCheckIn(b.getCheckIn());
            c.setCheckOut(b.getCheckOut());
            c.setReasonCance(reason);
            c.setR(b.getR());
            cd.insertCancel(c);
            rd.updateRoomFree(b.getR().getRoomID(), 1);
            boolean flaq = false;
            request.setAttribute("flaq", flaq);
            request.getRequestDispatcher("finish.jsp").forward(request, response);
        }

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

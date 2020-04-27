/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import dal.Account_HotelDAO;
import dal.AdminAccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Account_Admin;
import model.Admin_Hotel;

/**
 *
 * @author tranb
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
        request.getRequestDispatcher("sign_in.jsp").forward(request, response);
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

        String Red = request.getParameter("from");
        String userName = request.getParameter("username");
        String pass = request.getParameter("password");
        boolean flaq = false;
        String nameInfo = "";
        HttpSession sessionLogin = request.getSession();

        AdminAccountDAO aad = new AdminAccountDAO();

        AccountDAO ad = new AccountDAO();
        ArrayList<Account> accounts = ad.getAccount();
        for (Account account : accounts) {
            if (userName.equals(account.getUserName()) && pass.equals(account.getPassWord())) {
                flaq = true;
                nameInfo = account.getFullName();
                sessionLogin.setAttribute("accountLogin", account);
            }

        }
        Account_HotelDAO ahd = new Account_HotelDAO();
        if (userName != null) {
            Account_Admin aa = aad.getAdminAcc(userName);
            if (aa != null && aa.getPassword().equals(pass)) {
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }
            Admin_Hotel a = ahd.getAdmin_HotelsByUser(userName);
            if (a != null && a.getPassWord().equals(pass)) {
                request.setAttribute("ad_hotel", a);
                request.getRequestDispatcher("admin_hotel.jsp").forward(request, response);
            }
        }

        if (!flaq) {
            request.setAttribute("flaq", flaq);
            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
        } else {
            request.setAttribute("flaq", flaq);
            request.setAttribute("nameInfo", nameInfo);
            if (Red != null) {
                request.getRequestDispatcher(Red).forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        }
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

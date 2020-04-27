package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Booking;
import model.Room;
import model.Account;

public final class bookDetail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>Booking.com</title>\n");
      out.write("        <!-- Import Boostrap css, js, font awesome here -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">\n");
      out.write("        <link href=\"https://use.fontawesome.com/releases/v5.0.4/css/all.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\">\n");
      out.write("        </script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\">\n");
      out.write("        </script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\n");
      out.write("        <link href=\"./styles/styleSearch.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .dropdown-content {\n");
      out.write("                display: none;\n");
      out.write("                position: absolute;\n");
      out.write("                z-index: 1;\n");
      out.write("            }\n");
      out.write("            .dropdown:hover .dropdown-content {\n");
      out.write("                display: block;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    ");
 Account a = (Account) request.getSession().getAttribute("accountLogin");
        Booking b = (Booking) request.getAttribute("booking");
        Integer day = (Integer) request.getAttribute("day");
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Integer bid = (Integer) request.getAttribute("bid");
    
      out.write("\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-expand-md navbar-light bg-light sticky-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <a class=\"navbar-branch\" href=\"/booking\">\n");
      out.write("                    <img src=\"./images/logo.png\" height=\"80\">\n");
      out.write("                </a>\n");
      out.write("                <div class=\"slogan\"><a>Start the journey width no reason</a><i class=\"fas fa-plane\"></i></div>\n");
      out.write("                <div>\n");
      out.write("                    <ul class=\"navbar-nav ml-auto\">\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link active\" href=\"main\">Home</a>\n");
      out.write("                        </li>\n");
      out.write("                        ");
 if (a != null) {
      out.write("\n");
      out.write("                        <li class=\"nav-item dropdown\">\n");
      out.write("                            <a class=\"nav-link\">");
      out.print( a.getFullName());
      out.write(" </a>\n");
      out.write("                            <div class=\"dropdown-content\">\n");
      out.write("\n");
      out.write("                                <form action=\"main\" method=\"post\">\n");
      out.write("                                    <input type=\"hidden\" value = \"log_out\" name=\"log_out\">\n");
      out.write("                                    <button class=\"btn btn-link drodown-item\" style=\"color: black;  position: relative; left: -12px; top: -24px;\" type=\"submit\">Log_out</button>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </li>  \n");
      out.write("                        ");
} else {
      out.write("\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"sign_in.jsp\">Sign In</a>\n");
      out.write("                        </li>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        ");
 if (b != null) {
      out.write("\n");
      out.write("        <div>\n");
      out.write("            Check in:<a>");
      out.print( formatter.format(b.getCheckIn()));
      out.write("</a><br>\n");
      out.write("            Check out:<a>");
      out.print( formatter.format(b.getCheckOut()));
      out.write("</a><br>\n");
      out.write("            Room Type:<a>");
      out.print( b.getR().getRoomType());
      out.write("</a><br>\n");
      out.write("            Max Person:<a>");
      out.print( b.getR().getMaxPerson());
      out.write("</a><br>\n");
      out.write("            Price Per Night:<a>");
      out.print( b.getR().getPriceFerNight());
      out.write("</a><br>\n");
      out.write("            Hotel Name:<a>");
      out.print( b.getR().getH().getHotelName());
      out.write("</a><br>\n");
      out.write("            Book Time: <a>");
      out.print( formatter.format(b.getBookTime()));
      out.write("</a><br>\n");
      out.write("            Place:<a>");
      out.print( b.getR().getH().getP().getAddressPlace());
      out.write("</a><br>\n");
      out.write("            Book Day:<a> ");
      out.print( day);
      out.write(" Day</a><br>\n");
      out.write("            Total:<a>");
      out.print(b.getR().getPriceFerNight() * day);
      out.write("</a><br>\n");
      out.write("        </div>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        <form action=\"payment\" method=\"post\">\n");
      out.write("            <input type=\"hidden\" value=\"");
      out.print(bid);
      out.write("\" name=\"payment\">\n");
      out.write("            <input type=\"hidden\" value=\"");
      out.print(b.getR().getPriceFerNight() * day);
      out.write("\" name=\"price\">\n");
      out.write("            <button type=\"submit\" class=\"btn btn-success\">Payment</button>\n");
      out.write("        </form>\n");
      out.write("        <form action=\"payment\" method=\"post\">\n");
      out.write("            <input type=\"hidden\" value=\"");
      out.print(bid);
      out.write("\" name=\"cancel\">\n");
      out.write("            <br><label>Reason Cancel</label>\n");
      out.write("            <br><textarea name=\"textarea\" rows=\"5\" cols=\"30\"></textarea>\n");
      out.write("            <button style=\"    position: relative;\n");
      out.write("                    left: 225px;\n");
      out.write("                    top: -52px;\n");
      out.write("                    transition: none 0s ease 0s;\n");
      out.write("                    cursor: move;\" type=\"submit\" class=\"btn btn-danger\">Cancel</button>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class sign_005fup_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>Sign Up</title>\n");
      out.write("        <!-- Import Boostrap css, js, font awesome here -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">\n");
      out.write("        <link href=\"https://use.fontawesome.com/releases/v5.0.4/css/all.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\">\n");
      out.write("        </script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\">\n");
      out.write("        </script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\n");
      out.write("        <link href=\"./styles/style2.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    ");
 Boolean flaq = (Boolean) request.getAttribute("flaq");
        if (flaq == null) {
            flaq = true;
        }
    
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid bg\">\n");
      out.write("            <div class=\"row justify-content-center\">\n");
      out.write("                <div class=\"col-xs-12 row-container\">\n");
      out.write("                    <form action=\"register\" method=\"post\">\n");
      out.write("                        <h1>Are you ready to travel !</h1>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"nameCus\" class=\"label\">Full Name*</label>\n");
      out.write("                            <input type=\"text\" name=\"fullname\" class=\"form-control\" id=\"nameCus\" placeholder=\"Full Name\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"address\" class=\"label\">Address*</label>\n");
      out.write("                            <input type=\"text\" name=\"address\" class=\"form-control\" id=\"address\" placeholder=\"Address\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"phone\" class=\"label\">Phone Numbers*</label>\n");
      out.write("                            <input type=\"text\" name=\"phone\" class=\"form-control\" id=\"phone\" placeholder=\"Phone Numbers\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"birthday\" class=\"label\">BirthDay*</label>\n");
      out.write("                            <input type=\"date\" name=\"birthday\" class=\"form-control\" id=\"birthday\" placeholder=\"BirthDay\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"user\">User Name*</label>\n");
      out.write("                            <input type=\"text\" name=\"user\" class=\"form-control\" id=\"user\" placeholder=\"User Name\"  required  minlength=\"8\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"password\" class=\"label\">Password*</label>\n");
      out.write("                            <input type=\"password\" name=\"password\" class=\"form-control\" id=\"password\" placeholder=\"Password\" required minlength=\"8\">\n");
      out.write("                        </div>\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-success btn-block my-3\">Finish</button>\n");
      out.write("                        ");
if (!flaq) {
      out.write("\n");
      out.write("                        <div class=\"thongbao\">\n");
      out.write("                            <h6 style=\"color: red\">User name is exist!</h6>\n");
      out.write("                        </div>\n");
      out.write("                        ");
}
      out.write("   \n");
      out.write("                        <h6 ><a href=\"login\"> Click here if you had account !</h6>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
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

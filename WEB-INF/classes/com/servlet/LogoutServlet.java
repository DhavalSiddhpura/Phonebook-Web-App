package com.servlet;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

import java.io.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        session.removeAttribute("user");

        HttpSession s2 = request.getSession();
        s2.setAttribute("loutmsg","You are successfully logged out..!" );
        response.sendRedirect("login.jsp");
        out.close();
    }
}

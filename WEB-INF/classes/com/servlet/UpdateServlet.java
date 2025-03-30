package com.servlet;
import javax.servlet.http.*;

import com.conn.DbConn;
import com.dao.ContactDAO;
import com.entity.Contact;

import java.io.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int cid = Integer.parseInt(request.getParameter("cid"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String about = request.getParameter("about");

        Contact c = new Contact();
        c.setId(cid);
        c.setName(name);
        c.setEmail(email);
        c.setPhoneno(phone);
        c.setAbout(about);
        ContactDAO dao = new ContactDAO(DbConn.getConn());
        HttpSession session = request.getSession();
        boolean f = dao.updateContact(c);
        if (f) {
            session.setAttribute("success", "Contact Updated Successfully......");
            response.sendRedirect("viewcontact.jsp");
        } else {
            session.setAttribute("error", "Failed to Save Contact!!!!");
            response.sendRedirect("editcontact.jsp?cid="+cid);
        }
    }
}

package com.servlet;
import javax.servlet.http.*;
import com.conn.DbConn;
import com.dao.ContactDAO;
import com.entity.Contact;
import java.io.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        ContactDAO dao = new ContactDAO(DbConn.getConn());
        HttpSession session = request.getSession();
        boolean f = dao.deleteContactById(cid);
        if (f) {
            session.setAttribute("success", "Contact Deleted Successfully......");
            response.sendRedirect("viewcontact.jsp");
        } else {
            session.setAttribute("error", "Failed to Delete Contact!!!!");
            response.sendRedirect("viewcontact.jsp");
        }
    }
    
}

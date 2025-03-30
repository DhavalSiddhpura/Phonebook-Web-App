package com.servlet;

import javax.servlet.http.*;

import com.conn.DbConn;
import com.dao.ContactDAO;
import com.entity.Contact;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;

import java.io.*;

@WebServlet("/addcontact")

public class AddContact extends HttpServlet{

        protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
            int userid = Integer.parseInt(request.getParameter("userid"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String about = request.getParameter("about");

            Contact c = new Contact(name,email,phone,about,userid);
            ContactDAO dao = new ContactDAO(DbConn.getConn());

            HttpSession session = request.getSession();

            boolean f = dao.saveContact(c);
            if(f){
                session.setAttribute("success","Contact Saved Successfully......");
                response.sendRedirect("addcontact.jsp");
            }else{
                session.setAttribute("error","Failed to Save Contact!!!!");
                response.sendRedirect("addcontact.jsp");
            }
        }
}
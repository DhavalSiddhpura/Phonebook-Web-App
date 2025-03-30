package com.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.UserDAO;
import com.entity.User;
import com.conn.DbConn;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User u = new User(name,email,password);

        UserDAO dao = new UserDAO(DbConn.getConn());
        boolean f = dao.userRegister(u);
        HttpSession session = request.getSession();
        if (f) {
            session.setAttribute("successmsg", "Registration Successfull");
            response.sendRedirect("login.jsp");
        } else {
            session.setAttribute("errormsg", "Something went wrong");
            response.sendRedirect("register.jsp");
        }

    }

    
}
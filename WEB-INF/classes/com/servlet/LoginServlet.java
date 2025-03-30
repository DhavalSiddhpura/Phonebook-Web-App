package com.servlet;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import com.dao.UserDAO;
import com.entity.*;
import com.conn.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO(DbConn.getConn());
        User user = dao.loginUser(email, password);

        HttpSession session = request.getSession(); 
        if (user != null) {
            session.setAttribute("user", user);
            System.out.println("User stored in session: " + session.getAttribute("user"));
            response.sendRedirect("index.jsp");
        } else {
            session.setAttribute("errormsg", "Invalid email or password");
            System.out.println("Login failed. Redirecting to login page.");
            response.sendRedirect("login.jsp");
        }
    }
}

    
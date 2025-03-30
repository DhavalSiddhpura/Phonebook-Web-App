package com.dao;
import com.dao.UserDAO;
import com.entity.User;
import com.conn.DbConn;
import java.sql.Connection;

public class UserDAOTest {
    public static void main(String[] args) {
        try {
            // 🔹 Establish Database Connection
            Connection conn = DbConn.getConn();
            if (conn != null) {
                System.out.println("Database connected successfully!");
            } else {
                System.out.println("Failed to connect to database.");
                return;
            }

            // 🔹 Create UserDAO instance
            UserDAO userDAO = new UserDAO(conn);

            // 🔹 Test login with valid credentials
            String testEmail = "d1@gmail.com"; // Change to valid email
            String testPassword = "2209";          // Change to valid password
            
            System.out.println("Testing login with email: " + testEmail);
            User user = userDAO.loginUser(testEmail, testPassword);

            if (user != null) {
                System.out.println("Login successful: " + user.toString());
            } else {
                System.out.println("Login failed. No user found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


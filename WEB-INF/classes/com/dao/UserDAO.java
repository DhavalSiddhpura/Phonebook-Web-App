package com.dao;
import java.sql.*;

import com.entity.User;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn){
        super();
        this.conn = conn;
    }

    public boolean userRegister(User u){
        boolean f  = false;
        try {
            String sql = "insert into user(name,email,password) values(?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getEmail());
            pstmt.setString(3, u.getPassword());
            int result = pstmt.executeUpdate();
            if(result==1){
                f = true;
            }

        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return f;
    }

    public User loginUser(String email,String pasword){
            User user = null;

        try {
            String sql = "select * from user where email=? and password=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, pasword);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                System.out.println("User found: " + user.toString());
            }else {
                System.out.println("No user found with given email and password."); 
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}

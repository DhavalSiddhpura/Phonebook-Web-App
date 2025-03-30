package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDAO {
    private Connection conn;

    public ContactDAO(Connection conn){
        super();
        this.conn = conn;
    }

    public boolean saveContact(Contact contact){
        boolean f = false;
        try{
            String query = "insert into contact(name,email,phone,about,userid) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, contact.getName());
            pstmt.setString(2, contact.getEmail());
            pstmt.setString(3, contact.getPhoneno());
            pstmt.setString(4, contact.getAbout());
            pstmt.setInt(5, contact.getuserId());
            int result = pstmt.executeUpdate();
            if(result == 1)
            {
                f = true;
            }    
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }

    public List<Contact> getAllContact(int userId) {
        List<Contact> contactList = new ArrayList<>();
        
        try {
            PreparedStatement pstmt = this.conn.prepareStatement("SELECT * FROM contact WHERE userid=?");
            pstmt.setInt(1, userId);
            ResultSet set = pstmt.executeQuery();
    
            while (set.next()) {
                Contact c = new Contact(); // Declare inside the loop
                c.setId(set.getInt("id"));
                c.setName(set.getString("name"));
                c.setEmail(set.getString("email"));
                c.setPhoneno(set.getString("phone"));
                c.setAbout(set.getString("about"));
    
                contactList.add(c);
            }
    
            System.out.println("Contacts Retrieved: " + contactList.size()); // Debugging print
    
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return contactList;
    }

    public Contact getContactById(int cid){
        Contact c = new Contact();
        
        try {
            
            PreparedStatement pstmt = this.conn.prepareStatement("SELECT * FROM contact WHERE id=?");
            pstmt.setInt(1, cid);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setPhoneno(rs.getString("phone"));
                c.setAbout(rs.getString("about"));
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return c;

    }


    public boolean updateContact(Contact c){
        boolean f = false;
        try{
            String query = "update contact set name=?,email=?,phone=?,about=? where id=?";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, c.getName());
            pstmt.setString(2, c.getEmail());
            pstmt.setString(3, c.getPhoneno());
            pstmt.setString(4, c.getAbout());
            pstmt.setInt(5, c.getId());
            int result = pstmt.executeUpdate();
            if(result == 1)
            {
                f = true;
            }    
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean deleteContactById(int id){
        boolean f = false;
        
        try {
            String query = "delete from contact where id=?";

            PreparedStatement p = this.conn.prepareStatement(query);
            p.setInt(1, id);
            int result = p.executeUpdate();
            if(result == 1)
            {
                f = true;
            }


            
        } catch (Exception e) {
           e.printStackTrace();
        }
        
        return f;

    }
}

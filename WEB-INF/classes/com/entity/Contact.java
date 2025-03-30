package com.entity;

public class Contact {
    private int id;
    private String name;
    private String email;
    private String phoneno;
    private String about;
    private int userId;

    public Contact(){
        super();
    }

    public Contact(String name,String email,String phoneno,String about,int userId){
        super();
        this.name=name;
        this.email=email;
        this.phoneno=phoneno;
        this.about=about;
        this.userId=userId;
    }

    // get and setter
    public void setId(int id){
        this.id = id;
    }
    public int getId(){
        return id;
    }
    public void setName(String name){
        this.name = name;
    }
    public String getName(){
        return name;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public String getEmail(){
        return email;
    }
    public void setPhoneno(String phoneno){
        this.phoneno = phoneno;
    }
    public String getPhoneno(){
        return phoneno;
    }
    public void setAbout(String about){
       this.about = about;
    }
    public String getAbout(){
        return about;
    }
    public void setuserId(int userId){
        this.userId = userId;
    }
    public int getuserId(){
        return userId;
    }

}

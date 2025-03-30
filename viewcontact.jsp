<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="component/allcss.jsp"%>

    <style>
        .crd-ho:hover{
            background-color: #ffff80;
        }
        .card{
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-top: 10px;
            position: relative;
            top: -1.0rem;
        }
    </style>
</head>
<body style="background-color:#cbd3cd;">
    <%@include file="component/navbar.jsp"%>
    
    <%@ page import="com.entity.User" %>
    <% if(user == null)
        {
            session.setAttribute("errormsg", "Please Login First!!!!!");
            response.sendRedirect("login.jsp");
        }
    %>
 
    <%@ page import="com.entity.User, com.entity.Contact, com.dao.ContactDAO, com.dao.UserDAO, com.conn.DbConn" %>  
    <%
        String successmsg = (String) session.getAttribute("success");
        String errormsg = (String) session.getAttribute("error");
        if(successmsg != null)
        {%>
            <div class="alert alert-success" role="alert"><%=successmsg%></div>
        <%
        session.removeAttribute("success");
    } 
    if (errormsg != null) {
        %>
                <p class="text-center text-danger" style="font-size: large; font-weight: bold;"><%= errormsg %></p>
        <%
                session.removeAttribute("error"); 
            }
        %>
    





    <div class="container">
        <div class="row p-4">
                <%@ page import="com.entity.User, com.entity.Contact, com.dao.ContactDAO, com.dao.UserDAO, com.conn.DbConn, java.util.List" %>
        <%
    if(user != null){
        ContactDAO cd = new ContactDAO(DbConn.getConn());
        List<Contact> contactList = cd.getAllContact(user.getId());
        for(Contact c : contactList) { %>
            <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body">
                    <h5>Name : <%=c.getName()%></h5>
                    <h6>Phone : <%=c.getPhoneno()%></h6>
                    <h6>Email : <%=c.getEmail()%></h6>
                    <h6>About : <%=c.getAbout()%></h6>
                    <div class="text-center">
                        <a href="editcontact.jsp?cid=<%=c.getId() %>" class="btn btn-primary text-white mr-3 mt-4">Update</a>
                        <a href="delete?cid=<%=c.getId()%>" class="btn btn-danger text-white mr-3 mt-4">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <% }
    }
%>




                
         
            
        </div>
    </div>






    <%@include file="component/footer.jsp"%>

</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="component/allcss.jsp"%>
</head>
<body style="background-color: #cbd3cd;">
    <%@include file="component/navbar.jsp"%>
    <%@ page import="com.entity.User" %>
    <% if(user == null)
        {
            session.setAttribute("errormsg", "Please Login First!!!!!");
            response.sendRedirect("login.jsp");
        }
    %>
    <div class="container-fluid">
        <div class="row p-4">
            <div class="col-md-4 offset-md-4">
                <div class="card" style="background-color: #f8f9fa;">
                    <div class="card-body">
                        <h3 class="text-center text-danger">Add Contact Details</h3>

                        <%
                        String successmsg = (String) session.getAttribute("success");
                        String errormsg = (String) session.getAttribute("error");
                    
                        if (successmsg != null) {
                    %>
                            <p class="text-center text-success" style="font-size: large; font-weight: bold;"><%= successmsg %></p>
                            
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

                        <form style="margin-top: 2rem; background-color: white;" action="addcontact" method="post">
                            <%
                                if(user!=null)
                                {%>
                                    <input type="hidden" name="userid" value="<%=user.getId()%>">

                                <%}
                            %>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Full Name</label>
                                <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                
                              </div>
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">  
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Phone No</label>
                                <input type="number" name="phone" class="form-control" id="examplephone" aria-describedby="emailHelp">  
                              </div>
                              <div class="form-group">
                               <textarea rows="3" cols="45" class="form-control" placeholder="About" name="about"></textarea>
                              </div>
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Save Contact</button>
                            </div>
                           
                          </form>
                    </div>
                </div>
            </div>
        </div>
            
    </div>
    <%@include file="component/footer.jsp"%>
</body>
</html>
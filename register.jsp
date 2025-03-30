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

    <div class="container-fluid">
        <div class="row p-4">
            <div class="col-md-4 offset-md-4">
                <div class="card" style="background-color: #f8f9fa;">
                    <div class="card-body">
                        <h3 class="text-center text-danger">Register Here</h3>
                        <%
                        String successmsg = (String) session.getAttribute("successmsg");
                        String errormsg = (String) session.getAttribute("errormsg");
                    
                        if (successmsg != null) {
                    %>
                            <p class="text-center text-success" style="font-size: large; font-weight: bold;"><%= successmsg %></p>
                            
                    <%
                    session.removeAttribute("successmsg"); 
                            
                        }
                    
                        if (errormsg != null) {
                    %>
                            <p class="text-center text-danger" style="font-size: large; font-weight: bold;"><%= errormsg %></p>
                    <%
                            session.removeAttribute("errormsg"); 
                        }
                    %>
                    
                        
                      


                        <form style="margin-top: 2rem;" method="post" action="register">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Full Name</label>
                                <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                
                              </div>
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">  
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Register</button>
                            </div>
                           
                          </form>
                    </div>
                </div>
            </div>
        </div>
            
    </div>
    <div class="container-fluid bg-primary text-white text-center p-3" style="position: fixed; bottom: 0; width: 100%;">
        <h4> Developed By Dhaval Siddhpura </h4>
    </div>
</body>
</html>
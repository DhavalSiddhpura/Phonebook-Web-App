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
        <div class="row p-5">
            <div class="col-md-4 offset-md-4">
                <div class="card" style="background-color: #f8f9fa;">
                    <div class="card-body">
                        <h3 class="text-center text-success">Login Here</h3>

                        <%
                        String errormsg = (String) session.getAttribute("errormsg");
                        if (errormsg != null) {%>
                            <p class="text-center text-danger" style="font-size: large; font-weight: bold;"><%= errormsg %></p>
                            <%
                            session.removeAttribute("errormsg");}
                        %>

                        <%
                        String logoutmsg = (String) session.getAttribute("loutmsg");
                        if (logoutmsg != null) {%>
                            <p class="text-center text-success" style="font-size: large; font-weight: bold;"><%= logoutmsg %></p>
                            <%
                            session.removeAttribute("loutmsg");}
                        %>




                        <form style="margin-top: 1.3rem;" method="post" action="login">
                        
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">  
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                           
                          </form>
                    </div>
                </div>
            </div>
        </div>
            
    </div>
 <div style="position: fixed; bottom: 0; width: 100%;">
    <%@include file="component/footer.jsp"%>
 </div>
</body>
</html>
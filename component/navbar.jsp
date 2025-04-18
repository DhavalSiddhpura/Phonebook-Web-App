<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #51608b;">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-address-book"></i> PhoneBook</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="addcontact.jsp"><i class="fa-solid fa-plus"></i> Add Contact </a>
        </li>
        
        <li class="nav-item active">
          <a class="nav-link" href="viewcontact.jsp"><i class="fa-solid fa-eye"></i> View Contact</a>
        </li>
      </ul>
      <%@ page import="com.entity.User" %>
      <%
        User user = (User)session.getAttribute("user");
        if(user == null)
        {%>
        <form class="form-inline my-2 my-lg-0">
            <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user"></i> Login</a>
            <a href="register.jsp" class="btn btn-danger ml-3 mr-3"><i class="fa-solid fa-user-plus"></i> Register</a>
        </form>
        <%
      }else{%>
        <form class="form-inline my-2 my-lg-0">
            <a href="" class="btn btn-success"><i class="fa-solid fa-user"></i> <%=user.getName()%></a>
            <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger ml-3 mr-3 text-white"><i class="fa-solid fa-sign-out"></i> Logout</a>
        </form>
        <%
      }
      %>
    </div>
    <!-- logout -->
     <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <h5>Are you sure you want to logout?</h5>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="logout" class="btn btn-primary">Yes</a>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
  </nav>
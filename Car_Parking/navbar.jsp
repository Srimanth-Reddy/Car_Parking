<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom" >

  <a class="navbar-brand" href="#">CPS-51</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <c:if test="${userobj.role eq 'admin' }">
      <li class="nav-item">
        <a class="nav-link" href="post_spot.jsp"><i class="fas fa-plus-circle" style="padding: 5px; font: serif;" ></i>Post Parking Spots</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="view_spot.jsp"><i class="fas fa-eye" style="padding: 5px; font: serif;"></i>View Parking Spots</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="post_worker.jsp"><i class="fas fa-plus-circle" style="padding: 5px; font: serif;" ></i>Post Workers</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="view_worker.jsp"><i class="fas fa-eye" style="padding: 5px; font: serif;"></i>View Workers</a>
      </li>
      
      </c:if>
      
      <c:if test="${userobj.role eq 'user' }">
      <li class="nav-item">
        <a class="nav-link" href="user.jsp"><i class="fas fa-plus-circle" style="padding: 5px; font: serif;" ></i>View Parking Spots</a>
      </li>
     
      </c:if>
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <c:if test="${userobj.role eq 'admin'}">
      <a href="admin.jsp" class="btn btn-light mr-1"><i class="fas fa-user" style="padding: 5px; font: serif;"></i>Admin</a>
      <a href="logoutServlet" class="btn btn-light" onclick="showAlert();myFunction();"><i class="fas fa-sign-out-alt"></i>LogOut</a>
      <script>
  	function showAlert() {
    var myText = "LogOut Successfull!";
    alert (myText);
 	 }
  </script> 
      </c:if>
      
      <c:if test="${userobj.role eq 'user'}">
      <a href="#" class="btn btn-light mr-1" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-user" style="padding: 5px; font: serif;"></i>${userobj.uname}</a>
      <a href="logoutServlet" class="btn btn-light" onclick="showAlert()" ><i class="fas fa-sign-out-alt"></i>LogOut</a>
      <script>
  	function showAlert() {
    var myText = "LogOut Successfull!";
    alert (myText);
 	 }
  </script>  
      </c:if>
      
       <c:if test="${userobj.role eq 'worker'}">
      <a href="WorkerHome.jsp" class="btn btn-light mr-1"><i class="fas fa-user" style="padding: 5px; font: serif;"></i>Worker</a>
      <a href="logoutServlet" class="btn btn-light" onclick="showAlert()" ><i class="fas fa-sign-out-alt"></i>LogOut</a>
      <script>
  	function showAlert() {
    var myText = "LogOut Successfull!";
    alert (myText);
 	 }
  </script>  
      </c:if>
      
      <c:if test="${empty userobj }">
      <a href="login.jsp" class="btn btn-light mr-1"><i class="fas fa-sign-in-alt"></i>Login</a>
      <a href="signup.jsp" class="btn btn-light"><i class="fas fa-user-plus"></i>Signup</a>
      </c:if>
    </form>
  </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <div class="card">
        <div class="card-body">
        <div class="text-center text-primary">
        <i class="fas fa-user-circle fa-3x"></i>
        </div>
        
        <table class="table">
        <tbody>
        
        <tr>
        <th scope="row">UserName</th>
        <th>${userobj.uname }</th>
        </tr>
        
        <tr>
        <th scope="row">Car-Registration Number</th>
        <th>${userobj.carRegNo}</th>
        </tr>
        
        <tr>
        <th scope="row">Email</th>
        <th>${userobj.email}</th>
        </tr>
        
        <tr>
        <th scope="row">Mobile Number</th>
        <th>${userobj.mobnum}</th>
        </tr>
        
        <tr>
        <th scope="row">Residential Address</th>
        <th>${userobj.resadd}</th>
        </tr>
        
        </tbody>
        </table>
        </div>
        </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="editProfile.jsp" class="btn btn-primary">Edit</a>
      </div>
    </div>
  </div>
</div>
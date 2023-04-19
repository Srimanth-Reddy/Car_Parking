<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User Profile</title>
<%@include file="all_css.jsp" %>

<script type="text/javascript">
function validate(){
	var pass=document.getElementById("pass").value;
	var cpass=document.getElementById("cpass").value;
	
	if(cpass!=pass){
		document.getElementById("cpasserror").innerHTML="Please enter the same password!";
		return false;
	}
	
	return true;
}
</script>

</head>
<style>
.back-i{
background-image: url("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/rm283-nunny-054-f.jpg?w=1200&h=1200&dpr=1&fit=clip&crop=default&fm=jpg&q=75&vib=3&con=3&usm=15&cs=srgb&bg=F4F4F3&ixlib=js-2.2.1&s=0c7bf97677e6c1253557f958e9b9ac98");
background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>

<body style="background-color:#f7f7f7;" class="back-i">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="navbar.jsp" %>

<div class="container-fluid">
<div class="row p-4">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<div class="text-center">
<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
<h5>Edit Profile</h5>
</div>

<form onsubmit="return validate()" action="updateProfileServlet" method="post">
<input type="hidden" name="mobnum" value="${userobj.mobnum}">

<div class="form-group">
<label>Enter UserName</label><input type="text" required="required" class="form-control" id="uname" aria-describedby="emailHelp" name="uname" value="${userobj.uname}">
</div>

<div class="form-group">
<label>Enter Car-Registration Number</label><input type="text" required="required" pattern="^[A-Z]{2}[ ][0-9]{2}[ ][A-Z]{0,3}[ ][A-Z0-9]{4}$" class="form-control" id="carnum" aria-describedby="emailHelp" name="carnum" value="${userobj.carRegNo}">
</div>

<div class="form-group">
<label>Enter Email</label><input type="email" required="required" pattern=".+@gmail\.com" class="form-control" id="email" aria-describedby="emailHelp" name="email" value="${userobj.email}">
</div>

<div class="form-group">
<label>Enter MobileNumber</label><input type="tel" required="required" pattern="[7-9]{1}[0-9]{9}" class="form-control" id="mobnumnew" aria-describedby="emailHelp" name="mobnumnew" value="${userobj.mobnum}">
</div>

<div class="form-group">
<label>Enter Residential Address</label><input type="text" required="required" class="form-control" id="resadd" aria-describedby="emailHelp" name="resadd" value="${userobj.resadd}">
</div>

<div class="form-group">
<label>Enter Password</label><input type="password" required="required" pattern="[A-Za-z0-9!@#$%^*_]{5,8}" class="form-control" id="pass" aria-describedby="emailHelp" name="pass" value="${userobj.password}">
</div>

<div class="form-group">
<label>Confirm Password</label><input type="password" required="required" pattern="[A-Za-z0-9!@#$%^*_]{5,8}" class="form-control" id="cpass" aria-describedby="emailHelp" name="cpass" >
<td><span style="color:red" id="cpasserror"></span></td>
</div>

<button type="submit" class="btn btn-primary badge-pill btn-block" onclick="showAlert()">Update</button>
<script>
  function showAlert() {
    if(validate())var myText = "Profile Updated!";
    else var myText = "Profile 'Not'-Updated!";
    alert (myText);
  }
  </script>
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top:50px;">
<%@include file="footer.jsp" %>
</div>
</body>
</html>
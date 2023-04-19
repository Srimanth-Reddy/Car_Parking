<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Sign up</title>
<%@include file="all_css.jsp" %>

<!-- Google sign in -->
<meta name="google-signin-client_id" content="1087763307848-dl2033ge8k238qibdbof9etch1v79mls.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async="true" defer="defer"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    var name=profile.getName();
    var email=profile.getEmail();
    
    document.getElementById("name").innerHTML = name;
    document.getElementById("status").innerHTML = 'Welcome '+name+'!<a href=success.jsp?email='+email+'&name='+name+' style="color: #FFFFFF; margin-left: 5%; border: 1.5px solid white"/>Continue with registration</a><p>'
    let element = document.getElementById("signoutbutton");
    let hidden = element.getAttribute("hidden");

    if (hidden) {
       element.removeAttribute("hidden");
    } else {
       element.setAttribute("hidden", "hidden");
    }
 
 
 }
 
function myFunction() {
    gapi.auth2.getAuthInstance().disconnect();
    location.reload();
 }
</script>

</head>
<style>
.page{
background: url("https://www.parkpca.com/wp-content/uploads/2018/08/Cars-parked-in-parking-lot.jpg");
   height :100%;
   background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  align : center;
}
.button-2 {
    display: block;
    width: 165px;
    height: 45px;
    background: #4E9CAF;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    line-height: 25px;
}
.sign-up{

height: 70%;
  width: 55%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 20px;
  border:2px solid #467be3;
  margin-left: 25%;
  margin-top: -15%;
  background-color: #e4e8f5;
  border-radius-left: 15px;
}

.left {
  margin-left: 12%;
  margin-top: 15%;
  margin-bottom: -25%;
  background-color: #e4e8f5;
}

.right {
  height: 553px;
   margin-left: 66%;
  margin-top: 11%;
  margin-bottom: -25%;
  width: 25%;
  background-color: #2E68AA;
  
}
</style>
<body class="page">
<%@include file="navbar.jsp" %>
<div class="card" style="color: #000000;">
<%
String status =(String)request.getAttribute("status");
if(status != null){
	out.println(status);
}
%>
</div>

<button  onclick="myFunction()" hidden="hidden" id="signoutbutton">Sign Out</button>


<!-- Signup Form -->
<fieldset>
<div class="sign-up left" align="center" id="withoutgmail">
<h1>Sign up</h1>
<h4>Fill in the following details to get registered!</h4>

<form onsubmit="return validate()" action="signupServlet" method="post" >
<table>

<tr>
<td>First Name : </td>
<td><input type="text" style="border-radius: 5px" id="fname" name="fname" required="required"></td>
<td><span style="color:red" id="fnameError">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td>Last Name : </td>
<td><input style="border-radius: 5px" type="text" id="lname" name="lname" required="required"></td> 
<td><span style="color:red" id="lnameError">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td>User name : </td>
<td><input type="text" style="border-radius: 5px" id="uname" name="uname" required="required"></td> 
<td><span style="color:red" id="unameError">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td>Residential Address : </td>
<td><input type="text" style="border-radius: 5px" id="resadd" name="resadd" required="required"></td> 
<td><span style="color:red" id="resadderror">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td>Mobile No : </td>
<td><input type="tel" style="border-radius: 5px" id="mobnum" name="mobnum" pattern="[7-9]{1}[0-9]{9}" required="required"></td> 
<td><span style="color:red" id="mobnumerror">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td>Car Registration Number : </td>
<td><input style="border-radius: 5px" type="text" id="carnum" name="carnum" pattern="^[A-Z]{2}[ ][0-9]{2}[ ][A-Z]{0,3}[ ][A-Z0-9]{4}$" required="required"></td> 
<td><span style="color:red" id="carnumerror">*</span></td> <!-- to make the field mandatory -->
<td><span id="carnumerror1">Ex:AZ 09 ABC 1234</span></td>
</tr> 

<tr>
<td>Email : </td>
<td><input style="border-radius: 5px" type="email" id="email" name="email" required="required" pattern=".+@gmail\.com"></td> <!-- type="email" ensures if correct email syntax is entered -->
<td><span style="color:red" id="emailerror">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td>Password : </td>
<td><input style="border-radius: 5px" type="password" id="pass" name="pass" pattern="[A-Za-z0-9!@#$%^*_]{5,8}" required="required"></td> <!-- type="password" ensures password is encrypted and with correct syntax -->
<td><span style="color:red" id="passerror">*</span></td> <!-- to make the field mandatory -->
<td><span id="passerror1">You can use A-Z,a-z,0-9,!@#$%^*_ (Size=5-8)</span></td>
</tr>  

<tr>
<td>Confirm Password : </td>
<td><input style="border-radius: 5px" type="password" id="cpass" name="cpass" required="required"></td>
<td><span style="color:red" id="cpasserror">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td><input style="margin-left: 110%; background-color: #a8b4f7;font-size:20px; margin-top: 10%; width: 220px; height: 40px; border-radius: 5px" type="submit" value="Register"></td>
</tr>

</table>
</form>
</div>
<div class="right">
<h4 style="margin-left: 20%; margin-top:10%; padding-top: 25px;padding-left:40px; color: white">Already a User?</h4>     <a href="login.jsp" style="font-size: 20px; margin-left: 30%" class="button-2" >Login Here</a>
<p style="color: white; font-size: 25px;margin-top: 30%; margin-left: 5%"> You can Sign-Up through your Google Account here :</p>
<div class="g-signin2" data-onsuccess="onSignIn" align="center"></div><br>
      <p id="name" style="color: #FFFFFF;"></p>
      <div id="status" style="color: #FFFFFF;"></div>


</div>
</fieldset>

</body>
</html>


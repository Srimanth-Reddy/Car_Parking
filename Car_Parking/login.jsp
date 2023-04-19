<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<%@include file="all_css.jsp" %>

<meta name="google-signin-client_id" content="1087763307848-dl2033ge8k238qibdbof9etch1v79mls.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async="true" defer="defer"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script type="text/javascript">

function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    var name=profile.getName();
    var email=profile.getEmail();
    document.getElementById("name").innerHTML = name;
    let element = document.getElementById("signoutbutton");
    let hidden = element.getAttribute("hidden");

    if (hidden) {
       element.removeAttribute("hidden");
    } else {
       element.setAttribute("hidden", "hidden");
    }
    document.getElementById("status").innerHTML = 'Welcome '+name+'!<a href=successlogin.jsp?email='+email+'&name='+name+' style="color: #FFFFFF; margin-left: 5%; border: 1.5px solid white"/>Continue with login</a></p>'
 }
 
function myFunction() {
    gapi.auth2.getAuthInstance().disconnect();
    location.reload();
 }
 
</script>

<style>
 .page-2{
 background: url("https://www.parkpca.com/wp-content/uploads/2018/08/Cars-parked-in-parking-lot.jpg");
   height :100%;
   background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  align : center;
 }
.image{
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-top: 100px;
}

.name{
  display: block;
  margin-top: 1em;
  margin-bottom: 1em;
  margin-left: 600px;
  margin-right: 0;
}
.split {
  height: 70%;
  width: 35%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 20px;
  border:1px solid #2E68AA;
  margin-top: -10%;
}

.left {
  margin-left: 15%;
  margin-top: 15%;
  margin-bottom: -25%;
  background-color: #e4e8f5;
}

.right {
   margin-left: 50%;
  margin-top: 15%;
  margin-bottom: -25%;
  background-color: #2E68AA;
  
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

</style>
</head>

<body class="page-2" >


<%@include file="navbar.jsp" %>
<div class="card" style="color: #000000;">
<%
String status =(String)request.getAttribute("status");
if(status != null){
	out.println(status);
}
%> 
</div>     
<button onclick="myFunction()" hidden="hidden" id="signoutbutton">Sign Out</button>

<div align="center" id="withoutgmaillogin">
<fieldset style="margin-top: 10%">
<div class="split left">
  <div class="centered">
<h1 style= "margin-top: 15%">Login to your Account</h1>

<form   action="loginServlet" method="post" ><table>

<tr>

<td><input  style = "margin-top: 10%; height : 50px; width: 260px;border:2px solid #2E68AA; border-radius: 5px"  type="text" id="uname"  name="uname" required="required" placeholder = "   Username   " ></td>
<td><span style="color:red" id="unameError" >*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>

<td><input style = "margin-top: 10%; height : 50px; width: 260px ; border:2px solid #2E68AA; border-radius: 5px" type="password" id="pass" name="pass" pattern="[A-Za-z0-9!@#$%^*_]{5,8}" required="required" placeholder = "    Password   "></td>
<td><span style="color:red" id="passerror">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td><input type="submit" style="width: 300px; height: 40px; margin-top: 20%; background : #4c75f5 " value="LOGIN"></td>
</tr>

</table>
</form>
</div>
</div>
<div class="split right">
  <div class="centered">
<p style="color: white; font-size: 25px;margin-top: 10%; margin-left: 5%">Don't have an account?</p>
<a href="signup.jsp" style="font-size: 20px" class ="button-2">Sign Up Here</a>
<p style="color: white; font-size: 25px;margin-top: 30%; margin-left: 5%">Sign-in through your Google Account:</p>
<div class="g-signin2"  data-onsuccess="onSignIn" align="center"></div>
<br>
      <p class="name" id="name" style="color:#FFFFFF;"></p>
      <div align="center" id="status" style="color:#FFFFFF;"></div>
</div>
 </div>
</fieldset>
</div>
</body>
</html>
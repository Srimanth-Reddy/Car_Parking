<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Phone Verification</title>
<%@include file="all_css.jsp" %>

</head>
<style>
.otp{
margin-top: 10%;
border: 1px solid #000000;


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
    font-size: 20px;
    margin-bottom: 2%;
}


</style>
<body>

<%@include file="navbar.jsp" %>
<div class="card" style="color: #000000;">
<%
String status =(String)request.getAttribute("status");
if(status != null){
	out.println(status);
}
%>
</div>
<div align="center" class="otp">

<h1>PHONE VERIFICATION</h1>

<h3 style="color:red"><i class="fas fa-sms"></i>We have sent an OTP to your mobile.</h3>

<form  action="OTPServlet" method="post">
<input type="hidden" name="action" value="phone">

<p style="font-size: 25px;">Enter OTP: </p>
<input type="text" id="otpid" name="otpid" placeholder="Enter OTP" style="border: 2px solid #000000; width: 290px;height: 30px"  required="required" pattern="[0-9]{6}">
<span  id="otpError" style="color:red">*</span>

<br><br>
<input type="submit" value="Verify"  class ="button-2">
</form>

</div>

</body>

</html>
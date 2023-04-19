<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Continue Registration</title>
<%@include file="all_css.jsp" %>

<%
 String name=(String)request.getParameter("name");
 String email=(String)request.getParameter("email");
  %>
</head>
<style>
.back-i{
background-image: url("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/rm283-nunny-054-f.jpg?w=1200&h=1200&dpr=1&fit=clip&crop=default&fm=jpg&q=75&vib=3&con=3&usm=15&cs=srgb&bg=F4F4F3&ixlib=js-2.2.1&s=0c7bf97677e6c1253557f958e9b9ac98");
background-position: center;
  background-repeat: no-repeat;
  background-size: cover;


}
</style>
<body class="back-i">

<%@include file="navbar.jsp" %>
<div class="card" style="color: #000000;">
<%
String status =(String)request.getAttribute("status");
if(status != null){
	out.println(status);
}
%>
</div>
<div align="center">
<fieldset>
<legend><h1>Register</h1></legend>

<form action="signUpGoogleServlet" method="post">
<table>

<tr>
<td>UserName : </td>
<td><input id="uname" name="uname" required="required" value=<%=name %> readonly></td> 
<td><span style="color:red" id="resadderror">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td>Residential Address : </td>
<td><input type="text" id="resadd" name="resadd" required="required"></td> 
<td><span style="color:red" id="resadderror">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td>Mobile No : </td>
<td><input type="tel" id="mobnum" name="mobnum" pattern="[7-9]{1}[0-9]{9}" required="required"></td> 
<td><span style="color:red" id="mobnumerror">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td>Car Registration Number : </td>
<td><input type="text" id="carnum" name="carnum" pattern="^[A-Z]{2}[ ][0-9]{2}[ ][A-Z]{0,3}[ ][A-Z0-9]{4}$" required="required"></td> 
<td><span style="color:red" id="carnumerror">*</span></td> <!-- to make the field mandatory -->
<td><span id="carnumerror1">Ex:AZ 09 ABC 1234</span></td>
</tr> 

<tr>
<td>Email : </td>
<td><input id="email" name="email" required="required" value=<%=email %> readonly></td> <!-- type="email" ensures if correct email syntax is entered -->
<td><span style="color:red" id="emailerror">*</span></td> <!-- to make the field mandatory -->
</tr>

<tr>
<td><input type="submit" value="register"></td>
</tr>

</table>
</form>

</fieldset>
</div>

</body>
</html>
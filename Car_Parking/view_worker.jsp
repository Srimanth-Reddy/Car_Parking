<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ page import="db.DBConnect" %>
<%@ page import="dao.WorkerDao" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.worker" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: View Workers</title>

<%@include file="all_css.jsp" %>

</head>
<style>
.back-i{
background-image: url("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/rm283-nunny-054-f.jpg?w=1200&h=1200&dpr=1&fit=clip&crop=default&fm=jpg&q=75&vib=3&con=3&usm=15&cs=srgb&bg=F4F4F3&ixlib=js-2.2.1&s=0c7bf97677e6c1253557f958e9b9ac98");
background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.checked {
  color: orange;
}
</style>
<body style="background-color: #f0f1f2;" class="back-i">

<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>


<h5 class="text-center text-primary" style="font-size: 20px;">All Workers</h5>

<% WorkerDao dao=new WorkerDao(DBConnect.getConn());
List<worker> list=dao.getAllWorkers();
for(worker w:list){%>

<div class="container" id="firstone"> 
<div class="row" id="firstone">
<div class="col-md-12" id="firstone">

<div class="card mt=2" id="firstone" >
<div class="card-body" id="firstone">
<div class="text-center text-primary" id="firstone">
<i class="fas fa-parking fa-2x"></i>
</div>

<h6><%=w.getName() %></h6>
<p><%=w.getDescription() %></p>
<br>
<div class="form-row">
<div class="form-group col-md-3">
<input type="text" class="form-control form-control-sm" style="margin-left:5%" value="specialized in: <%=w.getSpecialized() %>" readonly>
</div>

</div>
<%if(w.getRating()==1){
	%>
	<span class="fa fa-star checked"></span>
<%
}
else if(w.getRating()==2){
	%>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<%
}
else if(w.getRating()==3){
	%>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<%
}
else if(w.getRating()==4){
	%>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<%
}
else if(w.getRating()==5){
	%>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<span class="fa fa-star checked"></span>
	<%
}
%>

<h6 style="margin-left:5%">Publish Date: <%= w.getPdate() %></h6>

<div class="text-center" id="firstone">
<a href="edit_workers.jsp?id=<%=w.getId()%>" class="btn btn-sm bg-success text-white" style="width: 60px;font-size: 15px;">Edit</a>
<a href="deleteWorkerServlet?id=<%=w.getId()%>" class="btn btn-sm bg-danger text-white" style="width: 60px;font-size: 15px;">Delete</a>
</div>

</div>
</div>
</div>
</div>
</div>

<%}
%>

</body>
</html>
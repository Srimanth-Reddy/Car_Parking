
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title > Car Parking Solutions </title>
<%@include file="all_css.jsp" %>

<style type="text/css">
.back-i{
background-image: url("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/rm283-nunny-054-f.jpg?w=1200&h=1200&dpr=1&fit=clip&crop=default&fm=jpg&q=75&vib=3&con=3&usm=15&cs=srgb&bg=F4F4F3&ixlib=js-2.2.1&s=0c7bf97677e6c1253557f958e9b9ac98");
background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
margin-bottom: -30%;
height: 100%;
padding-bottom: -250%;

}
.box {
  height:600px;
  display : flex;
  flex-direction : column;
  background: url("https://www.parkpca.com/wp-content/uploads/2018/08/Cars-parked-in-parking-lot.jpg") center/cover;
  -webkit-mask:
    radial-gradient(var(--r1,100%) var(--r2,50%) at top   ,white 79.5%,transparent 80%) top left,
    radial-gradient(var(--r1,100%) var(--r2,50%) at bottom,transparent 79.5%,white 80%) top center,
    radial-gradient(var(--r1,100%) var(--r2,50%) at top   ,white 79.5%,transparent 80%) top right;
  mask:
    radial-gradient(var(--r1,100%) var(--r2,50%) at top   ,white 79.5%,transparent 80%) top left,
    radial-gradient(var(--r1,100%) var(--r2,50%) at bottom,transparent 79.5%,white 80%) top center,
    radial-gradient(var(--r1,100%) var(--r2,50%) at top   ,white 79.5%,transparent 80%) top right;
   /* adjust the 150% to control the covered area, the bigger the value the bigger the area will be*/
  -webkit-mask-size:33.4% 160%;
  -webkit-mask-repeat:no-repeat;
  mask-size: 33.4% 160%;
  mask-repeat:no-repeat;}
  .box: after 
  {
  position : absolute;
  background: inherit;
  transform-origin: top right;
  transform : skewY(-4deg);
  
  
  }
  

div.transbox {
  margin-top: 10%;
  background-color: #f2f0f0;
  border: 3px solid black;
  opacity: 0.55;
  border-radius: 5px;
  width: 65%;
  margin-left: 20%;
  margin-bottom: 10%;
}

div.transbox p {
  margin: 5%;
  color: #000000;
  font-size: 20px;
}
.button-21 {
    display: block;
    width: 450px;
    height: 75px;
    background: #4E9CAF;
    padding-top: 20px;
    text-align: center;
    border-radius: 5px;
    color: white;
    line-height: 25px;
    margin-left: 20%;
    margin-bottom: -5%;
    font-size: 25px;
}

.button-22 {
    display: block;
    width: 450px;
    height: 75px;
    background: #4E9CAF;
    padding-top: 20px;
    text-align: center;
    border-radius: 5px;
    color: white;
    line-height: 25px;
    margin-left: 55%;
    margin-bottom: -5%;
    font-size: 25px;
}
  
</style>

</head>
<body  class="back-i">
<%@include file="navbar.jsp" %>
<div class="box" style="--r1:130%;--r2:71.5%">

</div>
<div class="text-center" style="margin-top: -5%;">
<h1 style="font-size: 50px; color:#000000; ">
<i class="fas fa-car" aria-hidden="true" style="color: #000000; margin-bottom: 10% ; margin-top: -100%; font-size: 60px"></i> Car Parking Solutions
</h1>
</div>


<div>
<a href="login.jsp"  class ="button-21"><i class="fas fa-sign-in-alt" ></i>  Registered user? Login Here</a>
</div>
<div>
      <a href="signup.jsp" class ="button-22"><i class="fas fa-user-plus"></i>   New User? Signup Here</a>
</div>


<div>
<div class="background">
  <div class="transbox">
  <h1 class="text-center"> About Us: </h1>
 
    <p>Nowadays while traveling to a new place or traveling for shopping or traveling to crowded places the main problem people face is where to park their four-wheeler safely. So we, at Car Parking Solutions came up with an idea to solve this problem by booking the parking slots beforehand while traveling to the concerned place. We also have workers who provide additional benefits to who park their four-wheelers like dry cleaning, car-washing and also do check for any repairs in the concerned parking time. So,we created this beautiful online car parking slot booking web application. This application should enable the users to book the parking slot beforehand while traveling to any shopping malls, tourist spots, markets, pilgrim centers especially crowded places.</p>
  </div>
</div>
</div>

<div>
<div class="background">
  <div class="transbox">
  <h1 class="text-center"> Contact Us: </h1>
    <p>
CPS-51(name of our company ) is handled by a group of 4 people. We focus on providing our developing skills for users and make real difference in this world.
We always evolve for the better.
Contact us for any suggestions!!
<br>
We would love to hear from you.
<br>
Name:CPS-51
<br>
<i class="fas fa-envelope"></i>Email:cps51@gmail.com
<br>
THANK YOU</p>
  </div>
</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>

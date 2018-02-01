<%-- 
    Document   : updateSuccess
    Created on : Jan 18, 2018, 5:38:26 PM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
       
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row" style="color:white;" id="menuBar">
            <div class="col-sm-12">
                <nav class="navbar " style="background:#7B1FA2;">
                     <div class="container-fluid">
                         <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span> 
                            </button>
                             <a class="navbar-brand" href="index.htm" style="color:white;">Product Manager</a>
                         </div>
                         <div class="collapse navbar-collapse navbar-right" id="myNavbar">
                            <ul class="nav navbar-nav">
                            <li class="active"><a href="index.htm" style="color:white;" id="homeLink">Home</a></li>
                            <li><a href="adminpanel.htm" style="color:white; cursor: pointer" id="adminLink">Admin Panel</a></li>
                            <li><a href="showAll.htm" style="color:white; cursor: pointer" id="adminLink">Show All</a></li>
                            <li><a href="findProduct.htm" style="color:white; cursor: pointer" id="adminLink">Update Details</a></li>
                           
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div><br/>
        <center>
        <h2 style="color:black;">Updation SuccessFull</h2>
            <P style="color:black; font-size:20px;">  You will Redirect to Home Page </P><div id="counter" style="color:black;">5</div> <P style="color:black; font-size:20px;">Seconds </P>
    <script>
        setInterval(function() {
            var div = document.querySelector("#counter");
            var count = div.textContent * 1 - 1;
            div.textContent = count;
            if (count == 0) {
                window.location.href="http://localhost:8080/SpringFileUploadAssignment/index.htm";
            }
        }, 1000);
       </script></center>

    </body>
</html>

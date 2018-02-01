<%-- 
    Document   : findSuccess
    Created on : Jan 18, 2018, 5:57:03 PM
    Author     : vkunal1996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Welcome to Spring Web MVC project</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Nothing</title>
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
        <table>
            <tr>
                <th algn="left">Product Id :</th>
                <th algn="left">Product Name :</th>
                <th algn="left">Product Rate :</th>
                <th algn="left">Product Company :</th>
                <th algn="left">Product Picture :</th>   
            </tr>
            <c:forEach items="${listDetails}" var="st">
                <tr>
                    <td><c:out value="${st.productId}"/></td>
                    <td><c:out value="${st.productName}"/></td>
                    <td><c:out value="${st.productRate}"/></td>
                    <td><c:out value="${st.productCompany}"/></td>
                    <td><img src="images/${st.productPicture}" style="height:200px; width:200px;"/></td>
                </tr>
            </c:forEach>
                <tr>
                    <td><a href="updateForm.htm?productId=${productId}">Proceed to Update</a></td>
                </tr>
        </table>
    </center>
    </body>
</html>

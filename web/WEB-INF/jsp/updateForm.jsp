<%-- 
    Document   : findSuccess
    Created on : Jan 18, 2018, 5:10:32 PM
    Author     : vkunal1996
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
        <%
            //int productId=Integer.parseInt(request.getParameter("productID"));
            //System.out.print(productId);
            session.setAttribute("productId", request.getParameter("productId") );
            String getproductId=(String)session.getAttribute("productId");
            int productId=Integer.parseInt(getproductId);
            String productName=" ",productRate="",productCompany="",productPicture="";
            try{
                Connection cn;
                PreparedStatement st;
                ResultSet rs;
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url="jdbc:sqlserver://localhost;instanceName=vkunal1996;databaseName=Struts;user=vkunal1996;password=12345";
                cn=DriverManager.getConnection(url);
                String sql="Select * from ProductDetails where productId=?";
                st=cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                st.setInt(1,productId);
                rs=st.executeQuery();
                while(rs.next()){
                    productName=rs.getString("ProductName");
                    productRate=rs.getString("ProductRate");
                    productCompany=rs.getString("ProductCompany");
                    
                    productPicture=rs.getString("ProductPicture");

                }
               /* out.print(firstName);
                out.print(lastName);
                out.print(password);
                out.print(retypePassword);
                out.print(userName);
                out.print(gender);
                out.print(dob);
                out.print(contact);
                out.print(location);*/


            }
            catch(Exception e){
            
                e.printStackTrace();
            }
        %>
    <center>
        <form:form method="post" commandName="changeDetails" enctype="multipart/form-data">
             <table>
                <tr>
                    <th align="left">Product Id</th>
                    <td><form:input path="productId" value="<%=productId%>" disabled="true" />
                        <form:hidden path="productId" value="<%=productId%>"/>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th align="left">Product Name</th>
                    <td><form:input path="productName" value="<%=productName%>"/></td>
                    <td></td>
                </tr><tr>
                    <th align="left">Product Rate</th>
                    <td><form:input path="productRate" value="<%=productRate%>" /></td>
                    <td></td>
                </tr>
                <tr>
                    <th align="left">Product Company</th>
                    <td><form:input path="productCompany"  value="<%=productCompany%>" /></td>
                </tr>
                <script>
                  
                    </script>
                <tr>
                    <th align="left">Product Image</th>
                    <td><input type="file" id="imagePath" name="imagePath"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Update Details"/></td>
                </tr>
            </table>
        </form:form>
    </center>
    </body>
</html>

<%-- 
    Document   : aboutus
    Created on : 6 Oct, 2023, 9:49:46 PM
    Author     : Hemant
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us</title>
         <link href="css/bootstrap.css" rel="stylesheet"/>
        <script src="js/bootstrap.bundle.js"></script>
    </head>
    <body>
 <div class="container">

            <!--including header files-->
            <jsp:include page="header.jsp"/>
         <div class="row">
             <div class="col-sm-4" style="background-color: aqua; min-height: 600px">
                  <marquee direction="up" height="400" behavior="alternate" onmouseover="stop()" onmouseout="start()">
                <%
                DbManager dm = new DbManager();
                String query = "select * from news order by id desc";
                ResultSet rs = dm.select(query);
                while(rs.next()){
                  %>
                  <p style="text-align: center"><%=rs.getString("newstext")%></p>
                <%}%>
                </marquee>
             </div>
             <div class="col-sm-8" style="background-color: pink; min-height: 600px"></div>
         </div> 
        
         <!--including the footer files.-->
         
         <jsp:include page="footer.jsp"/>
        </div>        
    </body>
</html>

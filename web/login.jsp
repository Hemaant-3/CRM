<%-- 
    Document   : login
    Created on : 6 Oct, 2023, 9:55:42 PM
    Author     : Hemant
--%>

<%@page import="connect.DbManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css/bootstrap.css" rel="stylesheet"/>
        <script src="js/bootstrap.bundle.js"></script>
        <title>login</title>
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
             <div class="col-sm-8" style="background-color: pink; min-height: 600px">
                 <h2 style="color:blue; text-align: center">Login</h2>
                 <form method="post" class="form-group" action="controller.jsp">
                     <input type="hidden" value="login" name="page"/>
                     <table class="table table-bordered">
                         <tr>
                             <td>Enter UserId</td>
                             <td><input type="text" name="userid" class="form-control" /></td>
                         </tr>
                         <tr>
                             <td>Password</td>
                             <td>  <input type="password" name="password" class="form-control"/></td>
                         </tr>
                         <tr>
                             <td></td>
                             <td><button class="btn btn-success" type="submit">Submit</button></td>
                         </tr>
                     </table>
                     
                 </form>
             </div>
         </div> 
        
         <!--including the footer files.-->
         
         <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>

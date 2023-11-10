<%-- 
    Document   : adminhome
    Created on : 17 Oct, 2023, 5:37:05 PM
    Author     : Hemant
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
<%
    if(session.getAttribute("adminid")==null){
        response.sendRedirect("../login.jsp");
    } else{
        
  
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <link href="../css/bootstrap.css" rel="stylesheet"/>
        <script src="../js/bootstrap.bundle.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <div class="row">
                <div class="col-sm-12" style="min-height: 600px; background-color: lightgrey ">
                    <h2 style="color:blue; text-align: center">Customer Management</h2>
                    <table class="table table-bordered">
                        <tr>
                            <th>Name</th>
                            <th>Gender</th>
                            <th>Address</th>
                            <th>Contact No.</th>
                            <th>Email address</th>
                            <th>Reg. Date</th>
                        </tr>
                        <%
                        DbManager dm= new DbManager();
                         String query = "select * from customer";
               ResultSet rs=dm.select(query);
               while(rs.next()){
                        %>
                        <tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("gender")%></td>
 <td><%=rs.getString("address")%></td>
<td><%=rs.getString("contactno")%></td>
 <td><%=rs.getString("emailaddress")%></td>
<td><%=rs.getString("regdate")%></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            
        </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
<%}%>
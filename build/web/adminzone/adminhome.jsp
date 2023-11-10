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
                <div class="col-sm-12" style="min-height: 600px; background-color:lightgrey">
                    <h2 style="color:blue;text-align: center;">Add News & Event</h2>
                    <form method="post" class="form-group" action="control.jsp">
                        <input type="hidden" name="page" value="adminhome"/>
                        <table class="table table-bordered" style="width:70%; margin: auto;">
                            <tr>
                                <td>Enter News</td>
                                <td> <textarea name="newstext" class="form-control" required></textarea></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                    
                    <br/>
                    <br/>
                    <table class="table table-bordered">
                        <tr>
                            <th>SR No.</th>
                            <th>News</th>
                            <th>Posted date</th>
                            <th>Delete</th>
                            
                        </tr>
                        <%
   DbManager dm = new DbManager();
   String query = "select * from news order by id desc";
   ResultSet rs = dm.select(query);
   int i = 1;
   while(rs.next()){
       %>
       <tr>
           <td><%=i%></td>
           <td><%=rs.getString("newstext")%></td>
           <td><%=rs.getString("posteddate")%></td>
              <td>
                                <a href="deleteEnqu.jsp?id=<%=rs.getInt("id")%>&responsetype=newstext">
                                    <button type="button" class="btn btn-danger">Delete</button>
                        </a>
                            </td>  
       </tr>
       <%
       i++;
               }%>
                    </table>
                    
                </div>
             </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
<%}%>
<%-- 
    Document   : contactus
    Created on : 6 Oct, 2023, 9:05:58 PM
    Author     : Hemant
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
              <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <script src="js/bootstrap.bundle.js"></script>
        <title>Contact Us</title>
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
                
                 <h2 style="color: blue; text-align: center">Enquiry Form</h2>
                 
              
                 
                 <form class="form-group" method="post" action="controller.jsp">
                     <input type="hidden" value="contactus" name="page" />
                     
                     <table class="table table-bordered">
                         <tr>
                             <td>Enter Name</td>
                             <td><input type="text" name="name" class="form-control"/></td>
                         </tr>
                         <tr>
                             <td>Select Gender</td>
                             <td><input type="radio" name="gender" value="male" class="form-check-input"/>Male  
                              <input type="radio" name="gender" value="female" class="form-check-input" />Female
                             </td>
                         </tr>
                         <tr>
                             <td>Enter address</td>
                             <td><textarea name="address" class="form-control"></textarea></td>
                         </tr>
                         <tr>
                             <td>Enter contact</td>
                             <td><input type="number" name="contactno" class="form-control"/></td>
                         </tr>
                         <tr>
                             <td>Enter Email</td>
                             <td><input type="email" name="email" class="form-control"/></td>
                         </tr>
                         <tr>
                             <td>Enter enquiry</td>
                             <td>   <textarea name="inquirytext" class="form-control"></textarea> </td>
                         </tr>
                         <tr>
                             <td></td>
                             <td><button type="submit" class="btn btn-success">Submit</button></td>
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

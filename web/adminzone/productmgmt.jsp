<%-- 
    Document   : adminhome
    Created on : 17 Oct, 2023, 5:37:05 PM
    Author     : Hemant
--%>
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
                    <h2 style="text-align: center; color:blue;">Add Product</h2>
                    
                    <form class="form-group" method="post" action="../ProductUpload" enctype="multipart/form-data">
                        <table class="table table-bordered" style="margin:auto; width:70%">
                            <tr>
                                <td>Enter Product Name</td>
                                <td><input type="text" name="pname" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td>Enter Mfg Date</td>
                                <td>  <input type="date" name="mfgdate" required class="form-control"/></td>
                            
                            </tr>
                            <tr>
                                <td>Enter Exp date</td>
                                <td><input type="date" name="expdate" required class="form-control"/></td>
                                
                            </tr>
                            <tr>
                                <td>Enter Qty</td>
                               <td><input type="number" name="qty" required class="form-control"/></td>
                            </tr>
                            <tr>
                                <td>Price per Unit</td>
                                <td><input type="number" name="priceperunit" required class="form-control"/></td>
                            </tr>         
                            <tr>
                                <td>Select Product Image</td>
                                <td>
                                    <input type="file" name="prodimage" required class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><button type="submit" class=" btn btn-success">Submit</button></td>
                            </tr>
                        </table>
                    </form> 
                    
                </div>
            
        </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
<%}%>
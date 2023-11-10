<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
<%
if(request.getParameter("page").equals("changePassword")){
    String oldpwd = request.getParameter("oldpassword");
    String newpassword = request.getParameter("newpassword");
    String confirmpwd = request.getParameter("cnfpwd");
    String userid = session.getAttribute("custid").toString();
    if(newpassword.equals(confirmpwd)){
        DbManager dm = new DbManager();
        String query = "update login set password='"+newpassword+"' where userid='"+userid+"' and password='"+oldpwd+"'";
        
        if(dm.insertUpdateDelete(query)==true){
            response.sendRedirect("../login.jsp");
        } else{
                out.print("<script>alert('old password is not matched');window.location.href='changePassword.jsp'</script>");
        }
    }else{
        out.print("<script>alert('Newpassword and confirm passowrd are not matched');window.location.href='changePassword.jsp'</script>");
    }
}

// response section
else if(request.getParameter("page").equals("response")){
    String responsetype= request.getParameter("responsetype");
    String subject = request.getParameter("subject");
    String responsetext = request.getParameter("responsetext");
    String custid = session.getAttribute("custid").toString();
    DbManager dm = new DbManager();
    String query = "select * from customer where contactno='"+custid+"'";
    ResultSet rs = dm.select(query);
    if(rs.next()){
        String name = rs.getString("name");
        String contactno = rs.getString("contactno");
        String emailaddress = rs.getString("emailaddress");
      String  query1 = "insert into response(name,contactno,emailaddress,responsetype,subject,responsetext,responsedate) values('"+name+"','"+contactno+"','"+emailaddress+"','"+responsetype+"','"+subject+"','"+responsetext+"',curdate())";
        boolean res = dm.insertUpdateDelete(query1);
        if(res==true){
            out.print("<script>alert('Response is saved'); window.location.href='response.jsp';</script>");
        } else{
            out.print("ERROR");
        }
    }
}
%>
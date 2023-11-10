<%@page import="connect.DbManager"%>
<%

String str = request.getParameter("responsetype");
  DbManager dm = new DbManager();
   
if(str.equals("enquiry")){
  int id = Integer.parseInt(request.getParameter("id"));
   String query = "delete from enquiry where id='"+id+"'";
    if(dm.insertUpdateDelete(query)==true){
        out.print("<script> alert('Enquiry is deleted'); window.location.href='enquirymgmt.jsp'</script>");
    } else{
            out.print("<script> alert('Enquiry is not deleted'); window.location.href='enquirymgmt.jsp'</script>");
    }
     
}
if(str.equals("feedback")){
  int id = Integer.parseInt(request.getParameter("id"));
    // id is unique for feedback and complain
     String query = "delete from response where id='"+id+"'";
    if(dm.insertUpdateDelete(query)==true){
        out.print("<script> alert('Feedback is deleted'); window.location.href='feedback.jsp'</script>");
    } else{
            out.print("<script> alert('Feedback is not deleted'); window.location.href='feedback.jsp'</script>");
    }
     
}
if(str.equals("complain")){
  int id = Integer.parseInt(request.getParameter("id"));
    // id is unique for feedback and complain
     String query = "delete from response where id='"+id+"'";
    if(dm.insertUpdateDelete(query)==true){
        out.print("<script> alert('Complain is deleted'); window.location.href='complain.jsp'</script>");
    } else{
            out.print("<script> alert('Complain is not deleted'); window.location.href='complain.jsp'</script>");
    }
} 
      
//password change

if(str.equals("changepass")){
    String oldpwd = request.getParameter("oldpassword");
    String newpassword = request.getParameter("newpassword");
    String confirmpwd = request.getParameter("cnfpassword");
   String id =session.getAttribute("adminid").toString();
    if(newpassword.equals(confirmpwd)){
        String query = "update login set password='"+newpassword+"' where userid='"+id+"' and password='"+oldpwd+"'";
        
        if(dm.insertUpdateDelete(query)==true){
            response.sendRedirect("../login.jsp");
        } else{
                out.print("<script>alert('old password is not matched');window.location.href='changepass.jsp'</script>");
        }
    }else{
        out.print("<script>alert('Newpassword and confirm passowrd are not matched');window.location.href='changepass.jsp'</script>");
    }
}
// deleting news
if(str.equals("newstext")){
  
  int id = Integer.parseInt(request.getParameter("id"));
   String query = "delete from news where id='"+id+"'";
    if(dm.insertUpdateDelete(query)==true){
        out.print("<script> alert('News is deleted'); window.location.href='adminhome.jsp'</script>");
    } else{
            out.print("<script> alert('News is not deleted'); window.location.href='adminhome.jsp'</script>");
    }
     
}
%>
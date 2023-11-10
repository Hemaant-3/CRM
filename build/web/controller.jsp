
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.DbManager"%>
<%

//    out.print(request.getParameter("page"));
 if(request.getParameter("page").equals("contactus"))
    {


     String name = request.getParameter("name");
     String gender = request.getParameter("gender");
     String address = request.getParameter("address");
     String contact = request.getParameter("contactno");
     String email = request.getParameter("email");
     String enquiry = request.getParameter("inquirytext");
    out.print(name);
     DbManager dm = new DbManager();

//     String query = "insert into enquiry "

     String query="insert into enquiry(name, gender, address, contactno, email, enquiry, enquirydate) values('"+name+"','"+gender+"','"+address+"','"+contact+"','"+email+"','"+enquiry+"', curdate())";

     boolean res = dm.insertUpdateDelete(query);
     if(res==true){
      out.print("<script>alert('Enquiry is submitted');window.location.href='contactus.jsp';</script>");
     } else{
         out.print("<script>alert('Enquiry is not submitted');</script>");
     }
 }


// registration

 else if(request.getParameter("page").equals("registration")){

     String name = request.getParameter("name");
     String gender = request.getParameter("gender");
     String address = request.getParameter("address");
     String contact = request.getParameter("contactno");
     String email = request.getParameter("email");
     String password = request.getParameter("password");

     DbManager dm = new DbManager();
     String query1="insert into customer values('"+name+"','"+gender+"','"+address+"','"+contact+"','"+email+"',curdate())";

        String query2="insert into login(userid, password, usertype) values('"+contact+"','"+password+"','customer')";
   boolean fun1 = dm.insertUpdateDelete(query1);

   boolean fun =  dm.insertUpdateDelete(query2);

        if(fun1==true &&fun==true){
            out.print("<script>alert('Registration is done');window.location.href='registration.jsp'</script>");

        }
            else{
            out.print("<script>alert('Registration is not done');window.location.href='registration.jsp'</script>");
        }
 }
 
 
 
 
  // Login module     
 else if(request.getParameter("page").equals("login")){
            String userid = request.getParameter("userid");
            String password = request.getParameter("password");
//            out.print(userid);
            DbManager dm = new DbManager();
            
String query = "select *from login where userid='"+userid+"' and password='"+password+"'";
    ResultSet rs = dm.select(query);
//    out.print(rs.next());
//    if(rs.next()){
//        out.print("Hello");
//    }
    if(rs.next()){
        //valid user
        String usertype= rs.getString("usertype");
        if(usertype.equals("customer")){
            
            session.setAttribute("custid", userid); // session variable name is custid and value is userid.
          response.sendRedirect("customerzone/customerhome.jsp");
        } else{
            if(usertype.equals("admin")){
         // admin pannel
                session.setAttribute("adminid", userid);
                response.sendRedirect("adminzone/adminhome.jsp");
            }
        }
    }
    else{
        //invalid user
        out.print("<script>alert('Inavlid User');window.location.href='login.jsp';</script>");
    }
        }




%>
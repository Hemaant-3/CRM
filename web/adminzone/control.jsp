<%@page import="connect.DbManager"%>
<%
if(request.getParameter("page").equals("adminhome")){
    String newstext = request.getParameter("newstext");
    DbManager dm = new DbManager();
    String query = "insert into news (newstext,posteddate) values('"+newstext+"',curdate())";
    if(dm.insertUpdateDelete(query)==true){
        out.print("<script>alert('News is added'); window.location.href='adminhome.jsp';</script>");
    } else{
        out.print("<script>alert('News is not added!!'); window.location.href='adminhome.jsp';</script>");
    }
}
%>
<%--
    Document   : Dashboard_Home
    Created on : 28-dic-2017, 19.38.27
    Author     : AD-TEAM
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="bootstrap.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="stile_home.css">

  <style>
  @import url(http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

  
</style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="style.css">

        <title>HOME</title>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h3>Dashboard</h3>

                <div class="forms">
                  <div class="row">
                    <div class="col-sm-2 col-md-3  col-sm-offset-1">
                          <div id="imaginary_container">
                              <form action="Dashboard_Home.jsp" method="get">
                              <div class="input-group stylish-input-group input-append">
                                  <input type="number" class="form-control"  name="ir" placeholder="Valore IR" min="0" max="100" oninput="setCustomValidity('')" required oninvalid="this.setCustomValidity('Inserire valore IR(0-100)')" >
                                  <span class="input-group-addon">
                                      <button type="submit">
                                          <span class="glyphicon glyphicon-check"></span>
                                      </button>
                                    </form>
                                  </span>
                              </div>
                          </div>
                      </div>
                    <div class="col-sm-4 col-md-3 col-lg-3">
                       <div id="imaginary_container">
                          <form action="singleRobot.jsp" metod="get">
                           <div class="input-group stylish-input-group input-append">

                               <input type="number" class="form-control"  name="robot" placeholder="Ricerca ID Robot" min="1" max="90000" required oninvalid="this.setCustomValidity('Inserire ID Robot')" oninput="setCustomValidity('') " >
                               <span class="input-group-addon">
                                   <button type="submit">
                                       <span class="glyphicon glyphicon-search"></span>
                                   </button>
                                   </form>
                               </span>

                           </div>
                       </div>
                   </div>
                 <div class="col-sm-4 col-md-3">
                       <div id="imaginary_container">
                          <form action="singleCluster.jsp" method="get">
                           <div class="input-group stylish-input-group input-append">
                               <input type="number" name="cluster" placeholder="Ricerca ID Cluster" min="1" max="100" oninput="setCustomValidity('')" required oninvalid="this.setCustomValidity('Inserire IDCluster')" class="form-control"   >
                               <span class="input-group-addon">
                                   <button type="submit">
                                       <span class="glyphicon glyphicon-search"></span>
                                   </button>
                                 </form>
                               </span>
                           </div>
                       </div>
                   </div>

                </div>
            </div>
          </div>

             <div class="row">
            <div class="box">
                <%

                    response.setIntHeader("Refresh", 60);
                    int x=0;


                    if(request.getParameter("ir")==null){
                      x=40;
                    }else{
                        x= Integer.parseInt(request.getParameter("ir"));
                    }
                    request.setAttribute("ir", x);
                    out.print("<div class=\"row\">");
                    out.print("<center><text class=\"texto\">"+"Impostazione IR attuale:"+x+"%"+"</text></center>");
                    out.print("</div>");
                    String user="root";
                    String pass="root";
                    String url="jdbc:mysql://localhost/mydb";
                    Connection c;
                    Class.forName("com.mysql.jdbc.Driver");
                    c=DriverManager.getConnection(url,user,pass);
                    String cl="select * from cluster";
                    PreparedStatement s=c.prepareStatement(cl);
                    ResultSet rs =s.executeQuery();
                    while(rs.next()){
                        String idc=rs.getString(1);
                        int i=rs.getInt(2);
                        String urls="singleCluster.jsp?cluster="+""+idc+"&ir="+x;;
                        if(i<=x){
                            out.println("<a href=\""+urls+"\">"+"<div class=\"col-xs-2 col-sm-2 col-md-1 col-lg-1 robo\" style=\"background-color: green\"><h3>"+"c"+idc+"</h3>  <center><b><i>"+i+"%</i></b></center> </div>"+"</a>");
                        }else{
                            out.println("<a href=\""+urls+"\">"+"<div class=\"col-xs-2 col-sm-2 col-md-1 col-lg-1 robo\" style=\"background-color: red\"> <h3>"+"c"+idc+"</h3>  <center><b><i>"+i+"%</i></b></center></div>"+"</a>");
                        }
                    }

                %>

            </div>
            </div>
            <footer>
            	<div class="row">
            	<div class="col-md-4">
            	</div>
            	<div class="col-md-4">
                <p>@AD-TEAM</p>
            </div>
                <div class="col-md-4">
            	</div>
            </div>
            </footer>
        </div>
    </body>
</html>

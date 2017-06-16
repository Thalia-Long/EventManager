<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
         <link href="CSS/main.css" rel="stylesheet">
    </head>
    <body>
         <div class="container-fluid pull-right">
        <%Model.User u = (Model.User) session.getAttribute("thisUser");%>
        <font color="green">Welcome, <%=u.getfName()%> <%=u.getlName()%></font>
         </div>
    </body>
</html>
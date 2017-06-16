<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>       
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <!--Import the ajax library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
        type=""></script>
        <link href="CSS/main.css" rel="stylesheet">
        <style>
            body{padding:0;background-color:#fff;font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="pull-right">
                <div>
                    <%Model.User u = (Model.User) session.getAttribute("thisUser");%>
                    <font color="green">Welcome, <%=u.getfName()%> <%=u.getlName()%></font>
                </div>
                <div>
                    <form  action="click" method="post">
                        <span> <input name="click" type="submit" value="Home" class="menu-item"/></span>
                        <span> <input name="click" type="submit" value="My Events" class="menu-item" /></span>
                            <%Model.User obj = (Model.User) session.getAttribute("thisUser");
                                if (obj.getisAdmin()) {%>
                        <span><input name="click" type="submit" value="Venues" class="menu-item"/></span>
                            <%}%>
                        <span> <input name="click" type="submit" value="Account" class="menu-item"/></span>
                        <span> <input name="click" type="submit" value="Logout" class="menu-item"/></span>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

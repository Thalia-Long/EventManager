<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900' rel='stylesheet' type='text/css'>  
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/main.css" rel="stylesheet">
    </head>
    <body>
            <div class="container">
                <%if(request.getAttribute("userEmail") == null)
                    request.setAttribute("userEmail", "");
                if(request.getAttribute("userPassword") == null)
                    request.setAttribute("userPassword", "");
                if(request.getAttribute("doRemember") == null)
                    request.setAttribute("doRemember", "no");
                %>
            <form class="form-signin" name="loginForm" action="login" method="post">
                <h2 class="form-signin-heading">Please sign in</h2>
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="email" name="userEmail"  id="inputEmail" class="form-control" placeholder="Email address" value="<%=request.getAttribute("userEmail")%>" required="" autofocus="">
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" name="userPassword" id="inputPassword" class="form-control" placeholder="Password" value="<%=request.getAttribute("userPassword")%>" required="">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="yes"  name="doRemember" <%if(request.getAttribute("doRemember").equals("yes")) {%>checked<%}%>> Remember me
                    </label>
                </div>
                <div>
                <button class="btn btn-lg btn-primary" type="submit">Sign in</button>
                <button class="btn btn-lg btn-primary" type="button" onclick="location.href='Register.html'">Register</button>
                </div>
            </form>
        </div>	
    </body>
</html>

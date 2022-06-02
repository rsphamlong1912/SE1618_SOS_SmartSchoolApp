<%-- 
    Document   : login1
    Created on : Mar 3, 2022, 8:48:02 PM
    Author     : TrinhNgocBao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            .login-form {
                width: 340px;
                margin: 50px auto;
                font-size: 15px;
            }
            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 19px;
            }
            .login-form h2 {
                margin: 0 0 15px;
            }
            .form-control, .btn {
                min-height: 38px;
                border-radius: 2px;
            }
            .btn {        
                font-size: 15px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="login-form">
            <form id="form1" action="main" method="POST" >
                <h2 class="text-center">Log in</h2>       
                <div class="form-group">
                    <input type="text" name="userID" class="form-control " placeholder="UserID" required="required">
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Password" required="required">
                </div>
                <!--                <div class="g-recaptcha mb-3" data-sitekey="6Le3ANQeAAAAALLLnR9NGshK6drwtkWAMSa3C32L">                   
                                </div>-->
                <div id="error" class="" style="font-weight: bold;"></div>
                <div class="form-group">
                    <button type="submit" name="action" value="Login" class="btn btn-block btn-dark ">Log in</button>
                </div>
                <div class="clearfix">
                    <label class="float-left form-check-label"><input type="checkbox"> Remember me</label>           
                </div>        
            </form>
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                } else {
            %>
            <div class="alert alert-danger text-center" style="font-weight: bold;" role = "alert">
                <%= error%>
            </div>
            <%
                }
            %>            
        </div>

    </body>
</html>
<%-- 
    Document   : admin.jsp
    Created on : 02-06-2022, 01:07:25
    Author     : SE150925 Nguyen Van Hai Nam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Admin</h1>
        <a href="<c:url value="/main?action=ProfileDetail" />">See profile Detail</a>
    </body>
</html>

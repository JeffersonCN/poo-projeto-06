<%-- 
    Document   : quiz
    Created on : 30/05/2017, 18:06:05
    Author     : Leonardo
--%>

<%@page import="br.com.fatecpg.helpers.ServerHelpers"%>
<%@page import="com.fatecpg.data.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession userSession = request.getSession();
            Usuario usuarioLogado = (Usuario)userSession.getValue("usuarioLogado");
            if(!ServerHelpers.isLogged(usuarioLogado)){
                response.sendRedirect("index.jsp");
            }
        %>
        <h1>Página do</h1>
    </body>
</html>

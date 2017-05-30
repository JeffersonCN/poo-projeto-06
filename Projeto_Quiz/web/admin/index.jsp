<%-- 
    Document   : newjsp
    Created on : 29/05/2017, 21:46:32
    Author     : Cesar
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
            if(ServerHelpers.isAdminLogged(usuarioLogado) == false){
                response.sendRedirect(ServerHelpers.getRootPath(request)+"/index.jsp");
            }
        %>
        <h1>Hello World!</h1>
    </body>
</html>

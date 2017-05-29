<%-- 
    Document   : login
    Created on : 29/05/2017, 04:08:25
    Author     : Leonardo
--%>

<%@page import="com.fatecpg.data.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <%
        HttpSession userSession = request.getSession();
        String nomeUsuario = request.getParameter("usernameLogin");
        String senha = request.getParameter("senhaLogin");
        Usuario usuario = new Usuario(nomeUsuario, senha);

        ArrayList<Usuario> usuarios = Usuario.all();
        try {
            for (Usuario u : usuarios) {
                if (Usuario.hasUsername(nomeUsuario) && u.getPassword().equals(usuario.getPassword())) {
                userSession.setAttribute("nomeUsuario", usuario.getUsername());
                userSession.setAttribute("senhaUsuario", senha);
                response.sendRedirect("../index.jsp");
                break;
            } else {
            }
        }
    } catch (Exception ex) {%>
    <h3>ERRO:<%=ex.getMessage()%></h3>
    <%throw ex;
        }
    %>
</html>

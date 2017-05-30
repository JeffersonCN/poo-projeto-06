<%-- 
    Document   : index.jsp
    Created on : 28/05/2017, 01:18:36
    Author     : jeffersoncn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.fatecpg.data.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar Usuários</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("utf-8");
            HttpSession userSession = request.getSession();

            String mensagem = null;
            ArrayList<Usuario> usuarios = null;

            try {
                usuarios = Usuario.all();
            } catch (Exception e) {
                mensagem = "Erro ao carregar usuários";
            }

            if (usuarios != null) {
        %>
        <h1>Usuários</h1>
        <%
            mensagem = (String) userSession.getAttribute("mensagem");

            if (mensagem != null) {
        %>
        <p><%= mensagem%></p>
        <%
            }
        %>
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Nome</td>
                <td>Username</td>
                <td>Perfil</td>
            </tr>
            <%
                for (Usuario usuario : usuarios) {
            %>
            <tr>
                <td><%= usuario.getId()%></td>
                <td><%= usuario.getNome()%></td>
                <td><%= usuario.getUsername()%></td>
                <td><%= usuario.getPerfil().getDescricao()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>
    </body>
</html>

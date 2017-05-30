<%-- 
    Document   : edit
    Created on : 28/05/2017, 01:19:14
    Author     : jeffersoncn
--%>

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
            String mensagem = null;

            Integer id = null;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (Exception e) {
                mensagem = "Usuário não encontrado. ID inválido.";
            }

            if (id != null) {
                Usuario usuario = null;
                try {
                    usuario = Usuario.find(id);
                } catch (Exception e) {
                    mensagem = "Erro ao buscar usuário.";
                }

                if (usuario != null) {
        %>
        <form action="update.jsp" method="post">
            <h2>Alterar usuário</h2>
            <input type="hidden" name="id" id="id" value="<%= usuario.getId() %>" />
            <input type="radio" name="perfil" value="1" <%= usuario.getPerfilId() == 1 ? "checked" : "" %>> Admin
            <input type="radio" name="perfil" value="2" <%= usuario.getPerfilId() == 2 ? "checked" : "" %>> Jogador
            <br>
            <br>
            <label for="txtNome">Nome Completo:</label>
            <br>
            <input type="text" name="txtNome" id="txtNome" value="<%= usuario.getNome() %>"/>
            <br>
            <label for="txtUsername">Username:</label>
            <br>
            <input type="text" name="txtUsername" id="txtUsername" value="<%= usuario.getUsername()%>"/>
            <br>
            <br>
            <input type="submit" value="Alterar" />
        </form>
        <%
                }
            } else {
                mensagem = "ID informado do usuário é inválido.";
            }

        %>
    </body>
</html>

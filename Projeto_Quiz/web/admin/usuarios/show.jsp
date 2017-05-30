<%-- 
    Document   : show
    Created on : 28/05/2017, 01:19:49
    Author     : jeffersoncn
--%>

<%@page import="com.fatecpg.data.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz - Usuário</title>
    </head>
    <body>
        <h1>Usuário</h1>
        <%
            HttpSession userSession = request.getSession();
            String mensagem = null;

            Integer id = null;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (Exception e) {
                mensagem = "ID informado é inválido.";
            }

            if (id != null) {
                Usuario usuario = Usuario.find(id);

                if (usuario != null) {
        %>
        <p>
            Nome: <%= usuario.getNome()%><br>
            Username: <%= usuario.getUsername()%><br>
            Perfil: <%= usuario.getPerfil().getDescricao()%>
        </p>
        <%
                } else {
                    userSession.setAttribute("mensagem", "Usuário não encontrado.");
                    response.sendRedirect("index.jsp");
                }
            }
        %>
    </body>
</html>

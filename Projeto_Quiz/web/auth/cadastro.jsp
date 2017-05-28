<%-- 
    Document   : cadastro
    Created on : 28/05/2017, 17:19:08
    Author     : Leonardo
--%>

<%@page import="com.fatecpg.data.Perfil"%>
<%@page import="com.fatecpg.data.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <%
            String nome = request.getParameter("nomeCadastro");
            String senha = request.getParameter("senhaCadastro");
            
            Usuario usuario = new Usuario(nome, senha, 2);
            //usuario.store();
            
            session.setAttribute("nomeUsuario", nome);
            session.setAttribute("senhaUsuario", senha);
            response.sendRedirect("../index.jsp");
            %>
    </body>
</html>

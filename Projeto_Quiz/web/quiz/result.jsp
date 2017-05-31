<%-- 
    Document   : result
    Created on : 31/05/2017, 02:19:10
    Author     : jeffersoncn
--%>

<%@page import="com.fatecpg.data.Partida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Resultado</h1>
        <%
            String mensagem = (String) request.getSession().getAttribute("mensagem");
            if (mensagem != null) {
        %>
            Mensagem: <%= mensagem %>
        <%
            }

            request.getSession().removeAttribute("mensagem");
        %>
        <%
            Partida partida = (Partida) request.getSession().getAttribute("partida");

            if (partida != null) {
        %>
        <p>Questões respondidas: <%= partida.getNumeroRespondidas()%></p>
        <p>Pontuação: <%= partida.getPontuacao()%></p>
        <%
            }
        %>
    </body>
</html>

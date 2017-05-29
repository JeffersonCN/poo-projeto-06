<%-- 
    Document   : index.jsp
    Created on : 28/05/2017, 01:18:36
    Author     : jeffersoncn
--%>

<%@page import="com.fatecpg.data.Alternativa"%>
<%@page import="com.fatecpg.data.Questao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            HttpSession userSession = request.getSession();
            String mensagem = (String) userSession.getAttribute("mensagem");

            if (mensagem != null) {
        %>
        <p><%=mensagem%></p>
        <%
            }

            ArrayList<Questao> questoes = Questao.all();

            for (Questao questao : questoes) {
        %>
        <p>
            Questao: <%= questao.getTexto()%><br>
        <ol>
            <%
                for (Alternativa alternativa : questao.getAlternativas()) {
            %>
            <li>
                <%= alternativa.getTexto()%>
            </li>
            <%
                }
            %>
        </ol>
    </p>
    <%
        }

        userSession.removeAttribute("mensagem");
    %>
</body>
</html>

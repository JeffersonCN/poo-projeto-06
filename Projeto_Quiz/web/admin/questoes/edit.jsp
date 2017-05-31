<%-- 
    Document   : edit
    Created on : 28/05/2017, 01:19:14
    Author     : jeffersoncn
--%>

<%@page import="br.com.fatecpg.helpers.ServerHelpers"%>
<%@page import="com.fatecpg.data.Usuario"%>
<%@page import="com.fatecpg.data.Alternativa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fatecpg.data.Questao"%>
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
            Usuario adminLogado = (Usuario) userSession.getAttribute("usuarioLogado");
            if (ServerHelpers.isAdminLogged(adminLogado) == false) {
                userSession.setAttribute("erro", "Acesso negado.");
                response.sendRedirect(ServerHelpers.getRootPath(request) + "/index.jsp");
            } else{

            try {
                Integer id = Integer.parseInt(request.getParameter("id"));

                try {
                    Questao questao = Questao.find(id);

        %>
        <form action="update.jsp" method="post">
            <h2>Editar questão</h2>
            <label for="txtQuestao">Questão:</label>
            <input type="text" name="txtQuestao" id="txtQuestao" value="<%=questao.getTexto()%>" />
            <input type="hidden" name="id" value="<%= questao.getId()%>" />
            <h3>Alternativas</h3>
            <table border="1" style="border-collapse: collapse;">
                <tr>
                    <th>#</th>
                    <th>Texto</th>
                    <th>Correta</th>
                </tr>
                <%
                    ArrayList<Alternativa> alternativas = questao.getAlternativas();
                    int i = 0;
                    for (Alternativa alternativa : alternativas) {
                        i = alternativas.indexOf(alternativa);
                %>
                <tr>
                    <td><%= i + 1%>.</td>
                    <td><input type="text" name="alternativa[<%=i%>]" id="alternativa[<%=i%>]" value="<%=alternativa.getTexto()%>"/></td>
                    <td><input type="radio" name="correta" value="<%=i%>" <%= alternativa.isCorreta() ? "checked" : ""%>></td>
                </tr>
                <%
                            }

                        } catch (Exception e) {
                            userSession.setAttribute("mensagem", "Não foi possível encontrar a questão informada.");
                            response.sendRedirect("index.jsp");
                        }
                    } catch (Exception e) {
                        userSession.setAttribute("mensagem", "ID da questão informado é inválido.");
                        response.sendRedirect("index.jsp");
                    }
}
                %>
            </table>
            <br>
            <input type="submit" value="Editar" />
        </form>
    </body>
</html>

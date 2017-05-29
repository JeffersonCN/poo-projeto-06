<%-- 
    Document   : delete
    Created on : 28/05/2017, 01:19:40
    Author     : jeffersoncn
--%>

<%@page import="com.fatecpg.data.Questao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession();
    String mensagem = null;

    Integer id = null;
    try {
        id = Integer.parseInt(request.getParameter("id"));
    } catch (Exception e) {
        mensagem = "ID da questão informada é inválido.";
    }

    if (id != null) {
        Questao questao = Questao.find(id);

        if (questao != null) {
            if (questao.delete()) {
                mensagem = "Questão excluida com sucesso.";
            } else {
                mensagem = "Falha ao excluir questão.";
            }
        } else {
            mensagem = "Questão não encontrada.";
        }
    }

    userSession.setAttribute("mensagem", mensagem);
    response.sendRedirect("index.jsp");
%>
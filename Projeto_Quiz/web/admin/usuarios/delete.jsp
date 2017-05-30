<%-- 
    Document   : delete
    Created on : 28/05/2017, 01:19:40
    Author     : jeffersoncn
--%>

<%@page import="com.fatecpg.data.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            if (usuario.delete()) {
                mensagem = "Usuário excluido com sucesso.";
            } else {
                mensagem = "Falha ao excluir usuário. Tente novamente.";
            }
        } else {
            mensagem = "Usuário não encontrado.";
        }
    }

    userSession.setAttribute("mensagem", mensagem);
    response.sendRedirect("index.jsp");
%>
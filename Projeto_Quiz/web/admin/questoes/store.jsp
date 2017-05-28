<%-- 
    Document   : store
    Created on : 28/05/2017, 01:19:00
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
        <title>Quiz</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("utf-8");
            ArrayList<String> erros = new ArrayList<>();

            String textoQuestao = request.getParameter("txtQuestao");
            Questao questao = new Questao(textoQuestao);

            try {
                questao.store();
            } catch (Exception ex) {
                erros.add("Erro ao criar a Questão. Tente novamente.");
            }

            try {
                Integer correta = Integer.parseInt(request.getParameter("correta"));

                if (questao.getId() != null) {
                    ArrayList<Alternativa> alternativas = new ArrayList<>();
                    String txtAlternativa;

                    for (int i = 0; i < 4; i++) {
                        txtAlternativa = request.getParameter(String.format("alternativa[%d]", i));
                        alternativas.add(
                                new Alternativa(
                                        txtAlternativa,
                                        correta == i,
                                        questao.getId()
                                )
                        );
                    }

                    try {
                        for (Alternativa alternativa : alternativas) {
                            alternativa.store();
                        }
                    } catch (Exception e) {
                        erros.add("Erro ao criar as Alternativas. Tente novamente.");
                    }
                }
            } catch (Exception e) {
                erros.add("Erro ao ler alternativa correta");
            }
            
            session.setAttribute("erros", erros);
            
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>

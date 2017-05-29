<%-- 
    Document   : create
    Created on : 28/05/2017, 01:18:49
    Author     : jeffersoncn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../../WEB-INF/jspfs/links.jspf" %>
        <title>Quiz - Inserir Questão</title>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspfs/menu.jspf" %>
        <div id="wrapper">
            <%@include file="../../WEB-INF/jspfs/menuLateral.jspf"%>
            <div id="page-wrapper" class="container">
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Painel do Administrador</h2>   
                            <h5>Bem vindo, Admnistrador. </h5>
                            <form action="store.jsp" method="post">
                                <h2>Inserir nova questão</h2>
                                <label for="txtQuestao">Questão:</label>
                                <input type="text" name="txtQuestao" id="txtQuestao"/>
                                <h3>Inserir alternativas</h3>
                                <table border="1" style="border-collapse: collapse;">
                                    <tr>
                                        <th>#</th>
                                        <th>Texto</th>
                                        <th>Correta</th>
                                    </tr>
                                    <tr>
                                        <td>1.</td>
                                        <td><input type="text" name="alternativa[0]" id="alternativa[0]"/></td>
                                        <td><input type="radio" name="correta" value="0"></td>
                                    </tr>
                                    <tr>
                                        <td>2.</td>
                                        <td><input type="text" name="alternativa[1]" id="alternativa[1]"/></td>
                                        <td><input type="radio" name="correta" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td>3.</td>
                                        <td><input type="text" name="alternativa[2]" id="alternativa[2]"/></td>
                                        <td><input type="radio" name="correta" value="2"></td>
                                    </tr>
                                    <tr>
                                        <td>4.</td>
                                        <td><input type="text" name="alternativa[3]" id="alternativa[3]"/></td>
                                        <td><input type="radio" name="correta" value="3"></td>
                                    </tr>
                                </table>
                                <br>
                                <input type="submit" value="Cadastrar" />
                            </form>
                        </div>
                    </div>              
                </div>
            </div>     
        </div>
    </div>
</div>

<%@include file="../../WEB-INF/jspfs/footer.jspf" %>
<%@include file="../../WEB-INF/jspfs/scripts.jspf" %>
</body>
</html>

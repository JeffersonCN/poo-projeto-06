<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Index</title>
        <%@include file="WEB-INF/jspfs/links.jspf" %>
    </head>
    <body>
        <% HttpSession userSession = request.getSession();
            String mensagem = "";
            if((String)userSession.getAttribute("erro") != null){
                mensagem = (String)userSession.getAttribute("erro");
            }
        %>
        <div id="wrapper">
            <%@include file="WEB-INF/jspfs/menu.jspf" %>
            <div id="page-wrapper" class="container" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <p style="color: #DB0630;"><%= mensagem %></p>
                            <h1 class="text-center" style="font-size: 60px; color:red;"><b>Quiz</b></h1>   
                            </br><h3 class="text-center">Bem vindo ao quiz. </h3>
                            <p class="text-center">
                                Este � um Quiz, onde voc� pode se divertir e dar muita risada.
                                Crie sua conta agora e participe, e tente ficar em primeiro no </br>
                                <span style="font-size: 35px; color:red;"><b>Ranking</b>!</span>
                            </p></br>
                            <table border='0' style='text-align:center; margin-left: 10%;'>
                                <thead>
                                <th colspan="3"><h3 class="text-center"><b>Integrantes da Equipe</b></h3></th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <p class="text-center"><b>Jefferson Nascimento</b></p>
                                            <p class="text-center">Respons�vel por:</br>
                                                Cria��o do banco de dados;</br>
                                                Implementa��o do CRUD;</br>
                                                Implementa��o de gerenciamento de quest�es e usu�rios.</br>
                                            </p>
                                        </td>
                                        <td style='height: 1px; width: 20px;'></td>
                                        <td>
                                            <p class="text-center"><b>Leonardo Santos</b></p>
                                            <p class="text-center">Respons�vel por:</br>
                                                Suporte na cria��o do banco de dados;</br>
                                                Implementa��o do logoff por parte do administrador;<br>
                                                Implementa��o de autentica��o de usu�rio.<br>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p class="text-center"><b>Helaman Spadari</b></p>
                                            <p class="text-center">Respons�vel por:</br>
                                                Implemta��o do link da index ao css;</br>
                                                Cria��o da pasta includes;</br>
                                                Adi��o dos includes nas p�ginas;</br>
                                                Ajuste nas telas;</br>
                                                Testes.
                                            </p>
                                        </td>
                                        <td></td>
                                        <td>
                                            <p class="text-center"><b>Cesar Cesario</b><p>
                                            <p class="text-center">Respons�vel por:</br>
                                                Conte�do sobre a equipe na index principal;</br>
                                                Pesquisa de campo sobre perguntas do question�rio;</br>
                                                Identa��o e verifica��o de erros no codigo;</br>
                                                Feedback de teste do projeto.</br>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>              
                    <hr>
                    <div class="row"> 
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">
                                    Ranking
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Pontua??o</th>
                                                    <th>Nome</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <!--C?DIGO DE GERAR TABELA-->
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="WEB-INF/jspfs/footer.jspf" %>
        </div>
        <%@include file="WEB-INF/jspfs/modals.jspf" %>
        <%@include file="WEB-INF/jspfs/scripts.jspf" %>
        <% session.removeAttribute("erro");%>
    </body>
</html>

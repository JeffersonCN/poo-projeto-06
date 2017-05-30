﻿<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Index</title>
        <%@include file="WEB-INF/jspfs/links.jspf" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="WEB-INF/jspfs/menu.jspf" %>
            <div id="page-wrapper" class="container" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="text-center">Quiz</h2>   
                            <h3 class="text-center">Bem vindo ao quiz. </h3>
                            <p class="text-center">
                                Este é um site de quiz,
                                focado em entretenimento e desconstração faça já seu login e divirtá-se!
                            </p>
                            <center>
                                <div class="container text-center">
                                    <h3><b>Integrantes da Equipe</b></h3>
                                    <p>Jefferson Nascimento</p>
                                        <p>Responsável por:</br>
                                            Criação do banco de dados;</br>
                                            Implementação do CRUD;</br>
                                            Implementação de gerenciamento de questões e usuários.</br>
                                        </p>
                                    <p>Leonardo Santos</p>
                                        <p>Responsável por:</br>
                                            Suporte na criação do banco de dados;</br>
                                            Implementação do logoff por parte do administrador;<br>
                                            Implementação de autenticação de usuário.<br>
                                        </p>
                                    <p>Helaman Spadari</p>
                                        <p>Responsável por:</br>
                                            Implemtação do link da index ao css;</br>
                                            Criação da pasta includes;</br>
                                            Adição dos includes nas páginas.</br>
                                        </p>
                                     
                                        <p>Cesar Cesario<p>
                                        <p>Responsável por:</br>
                                            Conteúdo sobre a equipe na index principal;</br>
                                            Pesquisa de campo sobre perguntas do questionário;</br>
                                            Identação e verificação de erros no codigo;</br>
                                            Feedback de teste do projeto.</br>
                                        </p>
                                </div>
                            </center>
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
                                                    <th>Pontuação</th>
                                                    <th>Nome</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <!--CÓDIGO DE GERAR TABELA-->
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
    </body>
</html>

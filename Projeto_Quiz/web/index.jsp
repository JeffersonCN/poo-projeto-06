<!DOCTYPE html>
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
                            <p class="text-center">Este é um site de quiz, focado em entretenimento e desconstração faça já seu login e divirtá-se!  </p>
                            <h3><center><b>Integrantes da Equipe</b></center></h3>
                            
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

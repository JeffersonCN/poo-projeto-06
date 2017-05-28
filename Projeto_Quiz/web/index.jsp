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
            <nav class="navbar navbar-inverse navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">Quiz: index</a> 
                </div>
                <ul class="nav navbar-nav" style="padding-left: 2%;">
                    <li><a href="#"> Home</a></li>
                    <li><a href="#">Página</a></li>
                    <li><a href="#">Página</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right" style="margin-right: 2%;">
                    <li><a href="#" data-toggle="modal" data-target="#cadastroModal"><span class="glyphicon glyphicon-user"></span> Cadastre-se</a></li>
                    <!-- Modal -->
                    <div id="cadastroModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title text-center">Cadastro</h4>
                                </div>
                                <div class="modal-body">
                                    <!--FORM-->
                                    <form role="form">
                                        <br/>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-circle-o-notch"  ></i></span>
                                            <input type="text" class="form-control" placeholder="Nome" />
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                                            <input type="password" class="form-control" placeholder="Senha" />
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                                            <input type="password" class="form-control" placeholder="Reescreva a senha" />
                                        </div>
                                        <a href="index.html" class="btn btn-success ">Cadastrar</a>
                                        <hr />
                                        Já é cadastrado?  <a href="#" data-dismiss="modal" data-target="#loginModal" data-toggle="modal">Faça o Login</a>
                                    </form>
                                    <!--/FORM-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--FIM MODAL-->
                   
                </ul>
            </nav>
            <div id="page-wrapper" class="container" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="text-center">Quiz</h2>   
                            <h3 class="text-center">Bem vindo ao quiz. </h3>
                            <p class="text-center">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."  </p>
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
        <%@include file="WEB-INF/jspfs/scripts.jspf" %>
    </body>
</html>

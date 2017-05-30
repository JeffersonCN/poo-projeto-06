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
        <title>Quiz - Inserir Usuário</title>
    </head>
    <body>
        <form action="store.jsp" method="post">
            <h2>Inserir novo usuário</h2>
            <input type="radio" name="perfil" value="1"> Admin
            <input type="radio" name="perfil" value="2"> Jogador
            <br>
            <br>
            <label for="txtNome">Nome Completo:</label>
            <br>
            <input type="text" name="txtNome" id="txtNome"/>
            <br>
            <label for="txtUsername">Username:</label>
            <br>
            <input type="text" name="txtUsername" id="txtUsername"/>
            <br>
            <label for="txtSenha">Senha:</label>
            <br>
            <input type="password" name="txtSenha" id="txtSenha"/>
            <br>
            <label for="txtConfirmaSenha">Confirmação de Senha:</label>
            <br>
            <input type="password" name="txtConfirmaSenha" id="txtConfirmaSenha"/>
            <br>
            <br>
            <input type="submit" value="Cadastrar" />
        </form>
    </body>
</html>
<%-- 
    Document   : index
    Created on : 29/05/2017, 21:46:32
    Author     : Cesar
--%>

<%-- 
    Document   : index.jsp
    Created on : 28/05/2017, 01:18:36
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
        <%@include file="../WEB-INF/jspfs/links.jspf" %>
        <title></title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspfs/protecaoAdmin.jspf" %>
        <%@include file="../WEB-INF/jspfs/menu.jspf" %>
        <div id="wrapper">
            <%@include file="../WEB-INF/jspfs/menuLateral.jspf"%>
            <div id="page-wrapper" class="container">
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="text-center">Painel do Administrador</h2>   
                            <h5 class="text-center">Bem vindo, Admnistrador. </h5>
                            
                        </div>
                    </div>              
                </div>
            </div>     
        </div>
    </div>
</div>
<%@include file="../WEB-INF/jspfs/modals.jspf" %>
<%@include file="../WEB-INF/jspfs/footer.jspf" %>
<%@include file="../WEB-INF/jspfs/scripts.jspf" %>
</body>
</html>
<%-- 
    Document   : Detallesproducto
    Created on : 30/06/2019, 12:25:27 PM
    Author     : jonathan
--%>

<%@page import="Exchange.proyecto.persistencia.dao.usuarioDao"%>
<%@page import="Exchange.proyecto.persistencia.vo.CategoriasVo"%>
<%@page import="Exchange.proyecto.persistencia.dao.CategoriaDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Exchange.proyecto.persistencia.dao.ProductoDAO"%>
<%@page import="java.util.List"%>
<%@page import="Exchange.proyecto.persistencia.vo.PublicarVO"%>
<%@page import="Exchange.proyecto.persistencia.vo.usuariovo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles pedidos</title>
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                font:15px Arial, Helvetica, sans-serif;
                padding: 0;
                margin: 0;
                background-color: #f4f4f4;
            }
        </style>
    </head>
    <body>
        <%

            PublicarVO pvo = (PublicarVO) session.getAttribute("producto");
            usuariovo vo = (usuariovo) session.getAttribute("usuario");
            CategoriaDao cd = new CategoriaDao();
            List<CategoriasVo> lista = cd.listar();


        %>
        
            <jsp:include page="../Encabezado.jsp"></jsp:include>
            

            <div class="container">
                <div class="row">

                    <h2 align="center">Detalles</h2>
                    <form>
                        <div class="col-md-6" >
                            <div class="col-md-3"></div>
                            <div class="col-md-9">
                                <img src="../consultarimagen?id=<%=pvo.getId_publicar()%>" width="300" height="300">
                            <br>
                            <a href="../perfil?idusuario=<%=pvo.getId_usuario()%>"> <div class="col-md-6">
                                    <img src="" class="img-circle" width="80" height="80">
                                </div>

                                <div class="col-md-6">     
                                    <h4><%=pvo.getUsuario().getNombres()%></h4>                                
                                    <h4><%=pvo.getUsuario().getTelefono()%></h4>  

                                </div></a>

                        </div>
                    </div>

                    <div class="col-md-6" >
                        <h2 align="center"><%=pvo.getNombre()%></h2>
                        <br>

                        <div class="" style="border: 1px solid #E1E1E1;">
                            <%=pvo.getDescripcion()%>
                        </div>
                        <br>
                        <div style="border: 1px solid #E1E1E1;"><h5>Precio Estimado :<%=pvo.getPrecioestimado()%> </h5></div>

                        <br>

                        <div style="border: 1px solid #E1E1E1;"><h5>Cantidad :<%=pvo.getCantidad()%> </h5></div>
                        <br>
                        <div style="border: 1px solid #E1E1E1;"><h5>Ciudad : <%=pvo.getUsuario().getCiudadVO().getDescripcion()%></h5></div>
                        <br>
                        <div style="border: 1px solid #E1E1E1;"><h5>Categoria : <%=pvo.getCategoriasVo().getDescripcion()%></h5></div>
                    </div>

                    <br>
                    <center>
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                                <h4 align="center">Desea ingresar ala subasta</h4>
                                <div class="col-md-6">
                                    <input type="submit" value="Si" class="btn btn-primary form-control" name="">
                                </div>
                                <div class="col-md-6">
                                    <input type="submit"  value="No" class="btn btn-primary form-control" name="">
                                </div>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </center>

                </form>       	
            </div>
        </div>    
        <script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>


    </body>

</html>

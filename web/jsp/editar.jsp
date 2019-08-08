<%@page import="Exchange.proyecto.persistencia.vo.CiudadVO"%>
<%@page import="Exchange.proyecto.persistencia.dao.CiudadDao"%>
<%@page import="java.util.List"%>
<%@page import="Exchange.proyecto.persistencia.vo.usuariovo"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : editar
    Created on : 8/06/2019, 07:46:19 PM
    Author     : jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Perfil</title>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
        <style>
            form{

                background-color: #f4f4f4;

                padding: 3px;
                border: 1px solid #E1E1E1;
            }
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
            usuariovo vo = (usuariovo) session.getAttribute("usuario");
            CiudadDao ciudadDao = new CiudadDao();
            List<CiudadVO> ciudades = ciudadDao.ciudades();

        %>
        
            <jsp:include page="../Encabezado.jsp"></jsp:include>
       

        <div class="row container">
            <div class="col-md-2"></div>
            <div class="col-md-8" >
                <form method="POST" enctype="" action="../editar?id=${usuario.getId()}"  >                 
                    <h1 style="text-align: center">Editar Perfil</h1>
                    <br>

                    <div class="row ">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label col-sm-3" >Nombre:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="txtnombre" value="${usuario.getNombres()}" placeholder="">
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                                <label class="control-label col-sm-3" >Correo:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="${usuario.getCorreo()}" name="txtcorreo"  placeholder="">
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label col-sm-3" >Telefono:</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" value="${usuario.getTelefono()}"  name="txttelefono" placeholder="">
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="form-group">
                                <label class="control-label col-sm-3" >Ciudad:</label>
                                <div class="col-sm-9">
                                    <select name="txtciudad" class="form-control">
                                        <option>${usuario.getCiudadVO().getDescripcion()}</option>
                                        <c:forEach var="ciudad" items="<%=ciudades%>">
                                            <option value="${ciudad.getIdciudad()}">${ciudad.getDescripcion()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                    </div>
                    <center>

                        <div class="form-group ">
                            <input type="submit" value="Actualizar" name="editar" class="btn btn-primary ">
                        </div>
                    </center>
            </div>
        </form>
    </div>

</div>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>
</body>
</html>

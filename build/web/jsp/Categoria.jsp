<%-- 
    Document   : Categoria
    Created on : 28/06/2019, 12:27:41 PM
    Author     : jonathan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Exchange.proyecto.persistencia.vo.PublicarVO"%>
<%@page import="Exchange.proyecto.persistencia.vo.CategoriasVo"%>
<%@page import="java.util.List"%>
<%@page import="Exchange.proyecto.persistencia.dao.ProductoDAO"%>
<%@page import="Exchange.proyecto.persistencia.dao.CategoriaDao"%>
<%@page import="Exchange.proyecto.persistencia.dao.CategoriaDao"%>
<%@page import="Exchange.proyecto.persistencia.vo.usuariovo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/estiloprincipal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
            CategoriasVo cv = new CategoriasVo();
            int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
            usuariovo vo = (usuariovo) session.getAttribute("usuario");
            CategoriaDao cd = new CategoriaDao();
            ProductoDAO pdao = new ProductoDAO();
            List<CategoriasVo> lista = cd.listar();
            List<PublicarVO> producto = pdao.listarcategoria(idcategoria);

        %>

          <jsp:include page="../Encabezado.jsp"></jsp:include>
       
       
        <table border="0" align="center" width="1000">
            <%                int salto = 0;
            %>
            <c:forEach var="pd" items="<%=producto%>">
                <th><a href="../Detallesproducto?idproducto=${pd.getId_publicar()}"><img src="../consultarimagen?id=${pd.getId_publicar()}" height="200" width="200"><p>
                    <p>
                       Nombre: ${pd.getNombre()}<br>
                       Valor : ${pd.getPrecioestimado()}
                    </p>                    
                    <br>
                    </a>
                </th>
                <%
                    salto++;
                    if (salto == 4) {
                %>
                <tr>
                    <%
                            salto = 0;
                        }
                    %>
                </c:forEach>
        </table>
            <script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>
            <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>

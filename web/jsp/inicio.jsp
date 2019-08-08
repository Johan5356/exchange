<%@page import="Exchange.proyecto.persistencia.dao.ProductoDAO"%>
<%@page import="Exchange.proyecto.persistencia.vo.PublicarVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Exchange.proyecto.persistencia.vo.CategoriasVo"%>
<%@page import="java.util.List"%>
<%@page import="Exchange.proyecto.persistencia.dao.CategoriaDao"%>
<%@page import="Exchange.proyecto.persistencia.vo.usuariovo"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Exchange</title>
        <meta charset="utf-8">

        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name = "viewport" content="width=device-width">
        <meta name = "description" content="Exchange mas que una familia">
        <meta name = "keywords" content="diseño web, desarrollo web, seo, posicionamiento web">
        <meta name = "author" content="Render-2Web">
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
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
                CategoriaDao cd = new CategoriaDao();
                ProductoDAO pdao = new ProductoDAO();
                List<CategoriasVo> lista = cd.listar();
                List<PublicarVO> producto = pdao.verproducto();

            %>
            <jsp:include page="../Encabezado.jsp"></jsp:include>
            </header>
            <br>
        <center>
            <img src="../img/logolargo.png">
        </center>

        <section id="cabecera">
            <div class="contenedor">
                <h1>Profesionales Expertos en Intercambios Online</h1>
                <p>¿Deseas intercambiar algun objeto que no necesitas por otro que realmente necesitas</p>
            </div>
        </section>


        <section id="boletin">
            <div class="contenedor">
                <h1>Encuentra rapido tus objetos...</h1>
                <form>
                    <input type="text" name="texto" placeholder="Buscar objeto...">
                    <button type="submit" class="boton1">Buscar</button>
                </form>
            </div>
            <table border="0" align="center" width="1000">
            <%                int salto = 0;
            %>
            <c:forEach var="pd" items="<%=producto%>">
                <th> <a href="../detalles?idproducto=${pd.getId_publicar()}"><img src="../consultarimagen?id=${pd.getId_publicar()}" height="200" width="200"><p>
                        <p>
                            Nombre : ${pd.getNombre()}<br>
                            Valor : ${pd.getPrecioestimado()}<br>

                        </p>
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
        <footer>
            <center>
                <p>Exchange plataforma web. Copyrigth &copy; 2019</p>
            </center>

        </footer>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>
    </body>
</html>
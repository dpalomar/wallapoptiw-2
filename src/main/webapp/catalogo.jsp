<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.util.Collection"%>
<%@ page import = "Cliente.Dominios.productoDominio"%>
<%
	Collection<productoDominio> list = (Collection<productoDominio>) request.getAttribute("listaProductos");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Catálogo de productos</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/catalogo.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#avanzada").click(function() {
			cambiarVista();
		});
		$("#simple").click(function() {
			cambiarVista();
		});
		<% if(request.getAttribute("avanzada") != null){ %>
		cambiarVista();	
		<% } %>
	});
	function cambiarVista() {
		$("#buscador_avanzado").toggle();
		$("#buscador").toggle();
	}
	
	</script>
  </head>

  <body>
  
    <div class="container" id="container">
		<div class="header clearfix">
			<img src="images/logo.png" alt="Error en la imagen">
			<h2 class="text-muted">WALLAPOP</h2>
			<p>Encuentra tu producto ideal</p>
		</div>
	<form id="form_buscador" action="catalogo" method="post">
		<table id="buscador">
			<tr><td id="celda1"><b>Buscador de productos</b></td></tr> 
			<tr id="fila2">
			<td id="celda2">
				<span>Buscar producto:
				<input type="text" name="texto" class="buscarProd"></span>
				<span><button type="submit" value="Buscar" id="buscar" class="buscar btn btn-primary">Buscar</button></span><br><br>
			</td> 
			</tr> 
			<tr ><td id="avanzada"><a class="avanzada">+ Búsqueda avanzada</a></td></tr>
		</table>
	</form>
		
	<form id="form_buscador_avanzado" action="catalogo" method="post">
		<table id="buscador_avanzado">
			<tr><td id="celda1"><b>Buscador de productos avanzado</b></td></tr> 
			<tr id="busqueda_avanzada">
			<td>
			<ul id="filtrado">
				<li>Categoria: <select class="categorias" name="categoria" id="categ" >
						<option value="vacio" <% if(request.getAttribute("categoria") == null) { %> selected <% } %>>Cualquier categoría</option>
						<option value="mobiliario" <% if("mobiliario".equals(request.getAttribute("categoria"))) { %> selected <% } %> >Mobiliario</option>
						<option value="vehiculos" <% if("vehiculos".equals(request.getAttribute("categoria"))) { %> selected <% } %> >Vehículos</option>
						<option value="moda" <% if("moda".equals(request.getAttribute("categoria"))) { %> selected <% } %> >Moda y belleza</option>
						<option value="electronica" <% if("electronica".equals(request.getAttribute("categoria"))) { %> selected <% } %> >Electrónica</option>
						<option value="ocio" <% if("ocio".equals(request.getAttribute("categoria"))) { %> selected <% } %> >Ocio y deportes</option>
						<option value="otros" <% if("otros".equals(request.getAttribute("categoria"))) { %> selected <% } %> >Otros</option>
				</select></li>
				<li>Provincia: <input class="provincias" name="provincia" id="prov" value="${param.provincia}" /></li>
				<li>Vendedor: <input type="text" name="vendedor" class="vendedor" value="${param.vendedor}" /></li>
				<li>Título: <input type="text" name="titulo" class="tituloAvanzada" value="${param.titulo}" /></li>
				<li>Descripción: <input type="text" name="descripcion" class="descripcionAvanzada" value="${param.descripcion}" /></li>
			</ul> 
				<span><button type="submit" value="Buscar" id="buscar" class="buscar btn btn-primary">Buscar</button></span><br><br>
			</td>
		</tr>
			<tr ><td id="simple"><a class="avanzada">+ Búsqueda simple</a></td></tr>
		</table>
	</form>
	<br><br>
		<% for(productoDominio prod : list) { %>
		
		<div class='fav' id='fav1'> 
		
				<h4 class='tituloFav'><%= prod.getTitulo() %></h4>
				<p><b>Categoria:</b>&nbsp;&nbsp;&nbsp;<span class="categoria"><%= prod.getCategoria() %></span><br><br></p>
				<p><b>Descripcion:</b>&nbsp;&nbsp;&nbsp;<span class="descripcion"><%= prod.getDescripcion() %></span><br><br></p>
				<% //<img src="images/cajones.jpg" class="img-circle imagenesProductos" alt="Cajones blancos">%>
				<p><b>Precio:</b>&nbsp;&nbsp;&nbsp;<span class="precio"><%= prod.getPrecio() %></span><br><br></p>
				<p><b>Estado:</b>&nbsp;&nbsp;&nbsp;<span class="estado"><%= prod.getEstado() %></span></p>
		</div> 
		

		<% } %>
	
		<div class="footer">
			<p>&copy; 2016 Wallapop, Inc.</p>
		</div>

    </div> 
  </body>
</html>
    
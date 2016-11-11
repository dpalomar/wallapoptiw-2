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
	$("#avanzada").click(function(){
		$("#busqueda_avanzada").toggle();
	});
	});
	</script>
  </head>

  <body>
  
    <div class="container" id="container">
		<div class="header clearfix">
			<img src="images/logo.png" alt="Error en la imagen">
			<h2 class="text-muted">WALLAPOP</h2>
			<p>Encuentra tu producto ideal</p>
		</div>
	
	<table id="buscador">
		<tr><td id="celda1"><b>Buscador de productos</b></td></tr> 
		<tr id="fila2">
		<td id="celda2">
		<span>Buscar producto:<input type="text" class="buscarProd"></span>
		
		<span><button value="Buscar" id="buscar" class="buscar btn btn-primary">Buscar</button></span><br><br>
		</td> 
		</tr> 
		<tr ><td id="avanzada"><a class="avanzada">+ Búsqueda avanzada</a></td></tr>
		
		<tr id="busqueda_avanzada">
		<td>
		<ul id="filtrado">
			<li>Categoria: <select class="categorias" id="categ">
					<option value="vacio" selected>Cualquier categoría</option>
					<option value="mobiliario">Mobiliario</option>
					<option value="vehiculos">Vehículos</option>
					<option value="moda">Moda y belleza</option>
					<option value="electronica">Electrónica</option>
					<option value="ocio">Ocio y deportes</option>
					<option value="otros">Otros</option>
			</select></li>
			<li>Provincia: <input class="provincias" id="prov"></li>
			<li>Vendedor: <input type="text" class="vendedor"></li>
			<li>Título: <input type="text" class="tituloAvanzada"></li>
			<li>Descripción: <input type="text" class="descripcionAvanzada"></li>
		</ul> 
		</td>
	</tr>
	</table><br><br>
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
    
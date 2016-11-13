<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.Set"%>
<%@ page import = "Cliente.Dominios.productoDominio"%>
<%@ page import = "Cliente.Dominios.clienteDominio"%>
<%@ page import = "java.util.Collection"%>


<%
    clienteDominio usuario = (clienteDominio) request.getSession().getAttribute("usuario");
	Collection<productoDominio> listaProductos = (Collection<productoDominio>) request.getSession().getAttribute("listaProductos");	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Mis productos</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/perfilCliente.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    
	
	function confirmarProd(fav,boton1, boton2){
		$(boton1).css({"visibility":"visible"});
		$(boton2).css({"visibility":"hidden"});
		$(fav).css({"border":"solid 2px #A9D0F5"});
		
		document.getElementById('categoria').readOnly=true;
		document.getElementById('descripcion').readOnly=true;
		document.getElementById('precio').readOnly=true;
		document.getElementById('estado').readOnly=true;
	};
	
	$(document).ready(function(){
	$("#anadir").click(function(){
		$("#tabla2").toggle();
	});
		
	
	});
		
	$(document).ready(function(){
	$("#validar").click(function(){
		var titulo = $(".tituloProducto").val();
		var categoria = $("#categoria4").val();
		var descripcion = $("#descripcion4").val();
		var precio = $("#precio4").val();
		var estado = $("#estado4").val();
		var imagen = $("#imagen4").val();
		if( titulo == "" ){
			alert("Introduzca un título para el nuevo producto");
			return false;
		}
		if(categoria == ""){
			alert("Introduzca una categoria para el nuevo producto");
			return false;
		}
		if( descripcion == ""){
			alert("Introduzca una descripción para el nuevo producto");
			return false;
		}
		if(precio == ""){
			alert("Introduzca un precio para el nuevo producto");
			return false;
		}
		if (!/^([0-9])*$/.test(precio)){
			alert("El campo precio solo puede contener un numero");
			return false;
		}
		if(estado == ""){
			alert("Introduzca un estado para el nuevo producto");
			return false;
		}
 		
		
	});
	});

	function editarProd(){
		$("#fav").css({"border":"dashed 2px #DF0101"});
		$("#edit").css({"visibility":"hidden"});
		$("#confirm").css({"visibility":"visible"});
		
		document.getElementById('categoria').readOnly=false;
		document.getElementById('descripcion').readOnly=false;
		document.getElementById('precio').readOnly=false;
		document.getElementById('estado').readOnly=false;	
	};
	
	function eliminarProd(){
		return confirm("¿Esta seguro que quiere dar de baja el producto?");
		//$(nombre1).remove();
		//$(nombre2).remove();
		//$(nombre3).remove();	
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
      
      <div> 
		<ul id="opcionesmenu" class="nav nav-pills nav-stacked">
			<li  class="active" id='menu2' ><a href="#">Mis productos</a></li>	
		</ul>
	  </div>	
	  
	  <table id='tabla'>
		<tr>
			<td>
				<div class="oculto" id="productos">
					<h1 class='titulo'>MIS PRODUCTOS</h1>
					<p class='etiqueta'>A continuacion, se mostraran las productos que tiene puestos en venta. </p>
					<p class='etiqueta'>Si desea modificar o dar de baja un producto pinche en editar.</p>
					<p class='etiqueta'>Si desea añadir un nuevo producto pinche <button class="anadir btn btn-default" id="anadir">aquí.</button></p>
					
					
						
				
					<% for(productoDominio product : listaProductos){ %>
					
						<button class='elim btn btn-warning' id='edit' onclick='editarProd()'>Editar</button>
						<div class="fav" id="fav"> 
							<form action="productos" method="post">
								<input type="hidden" name="accion" value="editar" />
								<input type="hidden" name="titulo" value="<%= product.getTitulo() %>" />
								<input type="hidden" name="id" value="<%= product.getId() %>" />
								<button type="submit" class="cont btn btn-success" id="confirm" >Confirmar</button>
									<h4 class='tituloFav'><%= product.getTitulo() %></h4>
									<p>Categoria:&nbsp;&nbsp;&nbsp;<input type="text" class="categoria" id="categoria" name="categoria" readonly value="<%= product.getCategoria() %>"><br><br></p>
									<p>Descripcion:&nbsp;&nbsp;&nbsp;<input type="text" class="descripcion" id="descripcion" name="descripcion" readonly value="<%= product.getDescripcion() %>"><br><br></p>
								
									<img src="" class="img-circle imagenesProductos" alt="Cajones blancos">
								
									<p>Precio:&nbsp;&nbsp;&nbsp;<input type="text" class="precio" id="precio" name="precio" readonly value="<%= product.getPrecio() %>"><br><br></p>
									<p>Estado:&nbsp;&nbsp;&nbsp;<input type="text" class="estado" id="estado" name="estado" readonly value="<%= product.getEstado() %>"><br><br></p>
								
							</form>
							<a href="productos?accion=borrar&id=<%= product.getId() %>" >
								<button class='btn btn-danger eliminarProducto' onclick="eliminarProd()">Dar de baja el producto</button>
							</a>
						</div> 
					
					
					 <% } %>
					<br><br>
					<form id="formAlta" action="productos?accion=alta" method="post" >
						<table id="tabla2"> 
								<tr id="fila1"><td id="celda1"><b>Añade un nuevo producto</b></td></tr> 
								<tr id="fila2"> 
								<td><br>
									<label>Titulo&nbsp;&nbsp;&nbsp;
										<input type="text" name="titulo" class="tituloProducto"><br><br></label>
									<label>Categori­a&nbsp;&nbsp;&nbsp;
										<select class="categoria" name="categoria">
											<option value="cualquiera" selected>Cualquier categoria</option>
											<option value="Mobiliario">Mobiliario</option>
											<option value="Vehiculos">Vehículos</option>
											<option value="Moda y belleza">Moda y belleza</option>
											<option value="Electronica">Electrónica</option>
											<option value="Ocio">Ocio y deportes</option>
											<option value="Otros">Otros</option>
										</select>
									<br><br></label>
									<label>Descripcion&nbsp;&nbsp;&nbsp;
										<input type="text" name="descripcion" class="descripcion" id="descripcion4"><br><br></label>
									<label>Imagen&nbsp;&nbsp;&nbsp;
										<input id="imagen4" name="imagen" type="file" accept="image/*"><br><br></label>
									<label>Precio&nbsp;&nbsp;&nbsp;
										<input type="text" name="precio" class="precio" id="precio4" ><br><br></label>
									<label>Estado&nbsp;&nbsp;&nbsp;
										<input type="text" name="estado" class="estado" id="estado4" value="Disponible" readonly><br><br></label>
									<label>
										<button type="submit" class='validar btn btn-info' id='validar'>Añadir</button></label><br>
								</td>   
								</tr> 
						</table>
					</form>
					
					</div>
				</td>
				</tr>
			</table>
	  
	
	
 <div class="footer">
		<p>&copy; 2016 Wallapop, Inc.</p>
    </div>
    </div>
  </body>
</html>
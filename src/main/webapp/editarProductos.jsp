<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "Cliente.Dominios.productoDominio"%>    
<%
	productoDominio producto = (productoDominio) request.getAttribute("producto");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Editar producto</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/editar.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">

	function validacion(){
	var titulo = document.getElementById("titulo").value;
	var categoria = document.getElementById("categoria").value;
	var descripcion = document.getElementById("descripcion").value;
	var precio = document.getElementById("precio").value;
	var estado = document.getElementById("estado").value;
	
	
	if (titulo.length == 0){
		alert("Por favor introduce un titulo");
		return false;
	}
	if (categoria.length == 0){
		alert("Por favor introduce una categoria");
		return false;
	}
	if (descripcion.length == 0){
		alert("Por favor introduce una descripcion");
		return false;
	}
	if (precio.length == 0){
		alert("Por favor introduce un precio");
		return false;
	}
	if (!/^([0-9])*$/.test(precio)){
		alert("El campo precio solo puede contener un numero");
		return false;
	}
	if (estado.length == 0){
		alert("Por favor introduce un estado");
		return false;
	}
	if (!estado.equals("Disponible") || !estado.equals("Vendido") {
        alert("El estado solo puede ser disponible o vendido");
		return false;
    }
	
	return true;
	
	
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
	  
	  <form class="contenido" method="post">
					<h1 class='titulo'>INFORMACIÓN DEL PRODUCTO</h1>
					
					<input name="id" type="hidden" readonly="readonly" value="<%= producto.getId() %>">
					<p class='etiquetas'><b>Titulo&nbsp;&nbsp;&nbsp;</b><input type="text" class="tituloProducto" id="titulo" name="titulo" value="<%= producto.getTitulo()%>"><br><br></p>
					
					<p class='etiquetas'><b>Categori­a&nbsp;&nbsp;&nbsp;</b><select class="categorias" id="categoria" name="categoria">
					<option value="<%= producto.getCategoria()%>" selected></option>
					<option value="mobiliario">Mobiliario</option>
					<option value="vehiculos">Vehículos</option>
					<option value="moda">Moda y belleza</option>
					<option value="electronica">Electrónica</option>
					<option value="ocio">Ocio y deportes</option>
					<option value="otros">Otros</option>
					</select>
					
					<p class='etiquetas'><b>Descripcion&nbsp;&nbsp;&nbsp;</b><input type="text" class="descripcion" id="descripcion" name="descripcion" value="<%= producto.getDescripcion()%>"><br><br></p>
					<p class='etiquetas'><b>Imagen&nbsp;&nbsp;&nbsp;</b><input id="imagen4" type="file" accept="image/*"><br><br></p>
					<p class='etiquetas'><b>Precio&nbsp;&nbsp;&nbsp;</b><input type="text" class="precio" id="precio" name="precio" value="<%= producto.getPrecio()%>"><br><br></p>
					<p class='etiquetas'><b>Estado&nbsp;&nbsp;&nbsp;</b><input type="text" class="estado" id="estado" name="estado" value="<%= producto.getEstado()%>"><br><br></p>
					<input type="submit" onclick="return validacion();" value="Confirmar cambios" id="boton" class="btn btn-info">	
		</form>
	  
	  <div class="footer">
		<p>&copy; 2016 Wallapop, Inc.</p>
    </div>
    </div>
  </body>
</html>
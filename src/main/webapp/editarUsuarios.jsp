<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "Cliente.Dominios.clienteDominio"%>    
<%
	clienteDominio usuario = (clienteDominio) request.getAttribute("usuario");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Editar usuario</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/editar.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    	<script type="text/javascript">

	function validacion(){
		var nombre = document.getElementById("name").value;
		var apellido = document.getElementById("apellido").value;
		var ciudad = document.getElementById("ciudad").value;
		var email = document.getElementById("correo").value;
		var contras1 = document.getElementById("pass").value;
		//var expresion = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
		
	
	if (nombre.length == 0){
		alert("Por favor introduce un nombre");
		return false;
	}
	if (apellido.length == 0){
		alert("Por favor introduce un apellidos");
		return false;
	}
	if (ciudad.length == 0) {
        alert("Por favor introduce una ciudad de residencia");
		return false;
    }
	
	if (email.length == 0){
		alert("Por favor introduce una dirección de correo electrónico");
		return false;
	}
	/*if (!expresion.test(email)){
		alert("Por favor introduce una dirección de correo electrónico válida");
		return false;
	}*/
	
	if (contras1.length == 0){
		alert("Por favor introduce una contraseña");
		return false;
	}
	//alert("Registro completado con éxito")
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
	  
	  <form class="contenido" method="post" >
					<h1 class='titulo'>INFORMACIÓN PERSONAL</h1>
					
					<h3 class='subtitulo'>Datos personales</h3>
						
					<div id='datospersonales'>
						<p class='etiquetas'><b>Nombre:&nbsp;&nbsp;&nbsp;</b><input class="nombrecompleto" type="text" name="nombre" tabindex="1" id='name' value="<%= usuario.getNombre() %>" /><br><br></p>
						<p class='etiquetas'><b>Apellidos:&nbsp;&nbsp;&nbsp;</b><input class="apellidos" type="text" name="apellidos" tabindex="2" id='apellido' value="<%= usuario.getApellidos() %>"><br><br></p>
						<p class='etiquetas'><b>Provincia:&nbsp;</b><input type="text" name="ciudad" id="ciudad" tabindex="3" value="<%= usuario.getProvincia() %>"><br></p>
					</div>
					
					<div class='separacion'>
					<p>_________________________________________________________</p>
					</div>
					
					<h3 class='subtitulo'>Datos de usuario</h3>
						
					<div id='datosusuario'>
						<input name="id" type="hidden" readonly="readonly" value="<%= usuario.getId() %>">
						<p class='etiquetas'><b>E-mail:&nbsp;&nbsp;&nbsp;</b><input type="text" class="email" tabindex="4" id="correo" name= "email" readonly="readonly" value="<%= usuario.getCorreo() %>"><br><br></p>
						<p class='etiquetas' ><b>Contraseña:&nbsp;</b><input class="contrasena" name="contrasena" type="text" tabindex="5" id ='pass' value="<%= usuario.getContrasena() %>"><br><br></p>
					</div>
					<input type="submit" onclick="return validacion();" value="Confirmar cambios" id="boton" class="btn btn-info">
		</form>
	  <p>
		<a class ="btn btn-info" href="javascript:history.go(-1)">Volver</a>
	</p>
	  <div class="footer">
		<p>&copy; 2016 Wallapop, Inc.</p>
    </div>
    </div>
  </body>
</html>
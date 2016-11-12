<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "Cliente.Dominios.clienteDominio"%>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%
    clienteDominio usuario = (clienteDominio) request.getSession().getAttribute("usuario");
	
%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Mi perfil de usuario</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/perfilCliente.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	
	function eliminar(){
	confirm("¿Esta seguro que quiere darse de baja en la aplicación? Al hacerlo se le eliminaran automáticamente los productos que tiene puestos en su perfil.");
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
			<li  class="active" id='menu1'><a href="#">Información Personal</a></li>		
				
		</ul>
	</div>	
	
	<table id='tabla'>
		<tr>
			<td>
				<div id='informacionPersonal'>
					<h1 class='titulo'>INFORMACIÓN PERSONAL</h1>
					
					<a class='elim btn btn-warning' id='edit1' href="miUsuario?accion=editar"> 
					Editar</a>
					
					<h3 class='subtitulo'>Datos personales</h3>
						
					<div id='datospersonales'>
						<p class='etiquetas'><b>Nombre:&nbsp;&nbsp;&nbsp;</b><input class="nombrecompleto" type="text" name="nombrecompleto" tabindex="1" id='name' readonly="readonly" value="<%= usuario.getNombre() %>" ><br><br></p>
						<p class='etiquetas'><b>Apellidos:&nbsp;&nbsp;&nbsp;</b><input class="apellidos" type="text" name="apellidos" tabindex="2" id='apellido' readonly="readonly" value="<%= usuario.getApellidos() %>"><br><br></p>
						<p class='etiquetas'><b>Provincia:&nbsp;</b><input type="text" name="ciudad" id="ciudad" tabindex="3" readonly="readonly" value="<%= usuario.getProvincia() %>"><br></p>
					</div>
					
					<div class='separacion'>
					<p>___________________________________________________________________</p>
					</div>
					
					<h3 class='subtitulo'>Datos de usuario</h3>
						
					<div id='datosusuario'>
						<p class='etiquetas'><b>E-mail:&nbsp;&nbsp;&nbsp;</b><input type="text" class="email" tabindex="4" id='correo' readonly="readonly" value="<%= usuario.getCorreo() %>"><br><br></p>
						<p class='etiquetas' ><b>Contraseña:&nbsp;</b><input class="contrasena" name="contrasena" type="text" tabindex="5" id ='pass' readonly="readonly" value="<%= usuario.getContrasena() %>"><br><br></p>
					</div>
					<a class='btn btn-danger borrar' href="miUsuario?accion=borrar"  > 
					Darse de baja en la aplicación</a>
					
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
	    	    
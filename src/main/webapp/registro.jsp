<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%boolean registroCorrecto = false;
    if(request.getAttribute("registroCorrecto") != null &&
    		   ((String) request.getAttribute("registroCorrecto")) == "true")
    		{
    			registroCorrecto = true;
    		}
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Registro</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/login.css" rel="stylesheet">
	<link href="css/registro.css" rel="stylesheet">
	<script type="text/javascript">

	function validacion(){
	var email = document.getElementById("email").value;
	var contras1 = document.getElementById("contra1").value;
	var contras2 = document.getElementById("contra2").value;
	var nombre = document.getElementById("nomusu").value;
	var apellido = document.getElementById("apellidos").value;
	var ciudad = document.getElementById("prov");
	var optionSelIndex = ciudad.options[ciudad.selectedIndex].value;
	var expresion = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
	
	if (email.length == 0){
		alert("Por favor introduce tu dirección de correo electrónico");
		return false;
	}
	if (!expresion.test(email)){
		alert("Por favor introduce una dirección de correo electrónico válida");
		return false;
	}
	
	if (contras1.length == 0){
		alert("Por favor introduce tu contraseña");
		return false;
	}
	if (contras2.length == 0){
		alert("Por favor confirma tu contraseña");
		return false;
	}
	if(contras1 != contras2){
		alert("Las contraseñas no son iguales. Por favor, introduzca la misma contraseña en ambos campos");
		return false;
	}
	if (nombre.length == 0){
		alert("Por favor introduce tu nombre");
		return false;
	}
	if (apellido.length == 0){
		alert("Por favor introduce tus apellidos");
		return false;
	}
	if (optionSelIndex == 0) {
        alert("Por favor introduce tu ciudad de residencia");
		return false;
    }
	alert("Registro completado con éxito")
	return true;
	
	
}
	</script>
	
  </head>

  <body>

    <div class="container">
      <div class="header clearfix">
		<img src="images/logo.png" alt="Error en la imagen">
        <h2 class="text-muted">WALLAPOP</h2>
		<p>Encuentra tu producto ideal</p>
      </div>

		<div class="jumbotron">		
		
		<% if(!registroCorrecto) { %>
		
		<h2>Crea tu cuenta en "WALLAPOP"</h2>
		
		<form id="formulario" action="registroServlet" method="post">
		

				<div id="info">
					
					<h1 id="titul"> DATOS DEL REGISTRO </h1>
						
						<p id="introduc">Para registrarse en nuestra página web, deberá rellenar todos los campos. Cuando acabe se le mandará un e-mail, para confirmar su cuenta. Una vez dentro, podrá modificar sus datos entrando en su perfil. </p>

				</div><br><br>
				
				<fieldset id="personal"><legend>INFORMACIÓN DE USUARIO</legend><br>
					<p>E-mail:<input type="email" id="email" class="email form-control" tabindex="1"><br><br></p>
					<p>Contraseña:<input class="form-control" id="contra1" type="password" name="contra" tabindex="2"><br><br></p>
					<p>Confirmación de contraseña:<input class="form-control" id="contra2" type="password" name="contraseña" tabindex="3"><br><br></p>
				</fieldset><br><br>
		
				<fieldset><legend>INFORMACIÓN PERSONAL</legend><br>
					<p>Nombre de Usuario:<input id="nomusu" class="form-control" type="text" name="nombre" tabindex="4"><br><br></p>
					<p>Apellidos:<input id="apellidos" class="form-control" type="text" name="apellidos" tabindex="5"><br><br></p>
					<p>Ciudad de residencia:
					<select name="prov" id="prov" class="form-control">
					<option value="0">Selecciona</option>
					<option value="1">Álava</option>
					<option value="2">Albacete</option>
					<option value="3">Alicante</option>
					<option value="4">Almería</option>
					<option value="5">Asturias</option>
					<option value="6">Ávila</option>
					<option value="7">Badajoz</option>
					<option value="8">Barcelona</option>
					<option value="9">Burgos</option>
					<option value="10">Cáceres</option>
					<option value="11">Cádiz</option>
					<option value="12">Cantabria</option>
					<option value="13">Castellón</option>
					<option value="14">Ciudad Real</option>
					<option value="15">Córdoba</option>
					<option value="16">La Coruña</option>
					<option value="17">Cuenca</option>
					<option value="18">Gerona</option>
					<option value="19">Granada</option>
					<option value="20">Guadalajara</option>
					<option value="21">Guipúzcoa</option>
					<option value="22">Huelva</option>
					<option value="23">Huesca</option>
					<option value="24">Islas Baleares</option>
					<option value="25">Jaén</option>
					<option value="26">León</option>
					<option value="27">Lérida</option>
					<option value="28">Lugo</option>
					<option value="29">Madrid</option>
					<option value="30">Málaga</option>
					<option value="31">Murcia</option>
					<option value="32">Navarra</option>
					<option value="33">Orense</option>
					<option value="34">Palencia</option>
					<option value="35">Las Palmas</option>
					<option value="36">Pontevedra</option>
					<option value="37">La Rioja</option>
					<option value="38">Salamanca</option>
					<option value="39">Santa Cruz de Tenerife</option>
					<option value="40">Segovia</option>
					<option value="41">Sevilla</option>
					<option value="42">Soria</option>
					<option value="43">Tarragona</option>
					<option value="44">Teruel</option>
					<option value="45">Toledo</option>
					<option value="46">Valencia</option>
					<option value="47">Valladolid</option>
					<option value="48">Vizcaya</option>
					<option value="49">Zamora</option>
					<option value="50">Zaragoza</option>
					<option value="51">Ceuta</option>
					<option value="52">Melilla</option>
		</select>
		</p><br><br>
					
				</fieldset><br><br>
				<input type="submit" value="Enviar" onclick="return validacion();" class="btn btn-info">
		</form>
	
		<% } else  { %>
		
		<h2>Ya estas en "WALLAPOP"</h2>
		
		<div id="existe" title="Bienvenido">
		<p>Gracias por registrarse en nuestra página. Cuando sus datos hayan sido verificados se le activará la cuenta y podrá empezar a usar nuestros servicios. </p>
		</div>
<% } %>
		</div>

      <div class="footer">
        <p>&copy; 2016 Wallapop, Inc.</p>
      </div>

    </div> 
  </body>
</html>
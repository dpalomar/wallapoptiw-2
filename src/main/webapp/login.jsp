<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
boolean errorInicio = false;
if(request.getAttribute("loginCorrecto") != null &&
   ((String) request.getAttribute("loginCorrecto")) == "false")
{
	errorInicio = true;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/login.css" rel="stylesheet">
	
  </head>

  <body>

    <div class="container">
      <div class="header clearfix">
		<img src="images/logo.png" alt="Error en la imagen">
        <h2 class="text-muted">WALLAPOP</h2>
		<p>Encuentra tu producto ideal</p>
      </div>

		<div class="jumbotron">
		<form id="formLogin" action ="login" method ="post">
		<div class="form-group">
			<label for="exampleInputEmail1">Nombre de usuario</label>
			<input type="text" class="form-control" id="exampleInputEmail1" name="exampleInputEmail1" />
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Contraseña</label>
			<input type="password" class="form-control" id="exampleInputPassword1" name="exampleInputPassword1" />
		</div>
		<% if(errorInicio) { %>
		<div>
			<p style="color:red;">El nombre de usuario o la contraseña no es correcta.</p>
		</div>
		<% } %>
		<button type="submit" class="btn btn-info">Enviar</button>
		<a href="registro">
			<button type="button" class="btn btn-success" >Regístrate</button>
		</a>
		</form>
		</div>

      <div class="footer">
        <p>&copy; 2016 Wallapop, Inc.</p>
      </div>

    </div> 
  </body>
</html>

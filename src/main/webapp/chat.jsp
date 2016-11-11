<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.util.List" %>
<%@  page import = "Cliente.Dominios.Mensaje" %>
<%@ page import = "Cliente.Dominios.clienteDominio" %>
<% 
	List<Mensaje> listaMensajes = (List<Mensaje>) request.getAttribute("listaMensajes");
	clienteDominio usuario = (clienteDominio) request.getAttribute("usuario");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Chat</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/chat.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	
</head>
<body>
	<div class="container" id="container">
      <div class="header clearfix">
		<img src="images/logo.png" alt="Error en la imagen">
        <h2 class="text-muted">WALLAPOP</h2>
		<p>Encuentra tu producto ideal</p>
      </div>
		<h1>Lista de mensajes</h1>
	<table>
		<thead>

			<tr>
				<th>De</th>
				<th>Mensaje</th>
			</tr>

		</thead>
		<tbody>
			 <% for(Mensaje mens : listaMensajes) { %>
			 <% if (mens.getTo().getId() == usuario.getId()){ %>
				<tr>
					<td><%= mens.getFrom().getNombre() %></td>
					<td><%= mens.getMensaje() %></td>
				</tr>
				<% } %>
			<% } %>
		</tbody>
	</table>
	
	<form action="mensajes" method="post">
	<fieldset>
		<legend>CHAT de la aplicación WALLAPOP</legend>
		<textarea name="mensaje" id="mensaje" cols="30" rows="10"></textarea>
		<p>Indica el correo del destinatario:</p><input name="to" />
		<br/>
		<input class="btn btn-primary enviar" type="submit" value="enviar" />
		<input type="hidden"  name="from" value="<%= usuario.getId() %>" />
	</fieldset>
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
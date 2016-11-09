<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<c:forEach items="${listaMensajes}" var="mensaje">
				<tr>
					<td>${mensaje.from.nombre }</td>
					<td>${mensaje.mensaje }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="javascript:history.go(-1)">Volver</a>
	</p>
	
	 <div class="footer">
		<p>&copy; 2016 Wallapop, Inc.</p>
    </div>
    </div>
</body>
</html>
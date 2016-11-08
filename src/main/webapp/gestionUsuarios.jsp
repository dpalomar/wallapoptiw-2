<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Gestión de usuarios</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/gestionUsuarios.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
		
    function borrarFila(r){
    	var i = r.parentNode.parentNode.rowIndex;
    	document.getElementById("tablaGestion").deleteRow(i);
    	
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
	  
		<%
			try {
   			// Cargar el driver para conectarse a la BD e crear la conexion
   				Class.forName("com.mysql.jdbc.Driver");
   				Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiw", "root", "admin");
   			if (!conexion.isClosed()) {
      		// La consulta
      			Statement st = conexion.createStatement();
      			ResultSet rs = st.executeQuery("Select * from USUARIOS" );

      		// Ponemos los resultados en un table de html
      		out.println("<table id=\"tablaGestion\" class=\"table\" ><tr class=\"fila1\"><td>Nombre</td><td>Apellido</td><td>Contraseña</td><td>Correo</td><td>Provincia</td></tr>");
      		
      		while (rs.next()) {
      			
      			
      			out.println("<form action=\"modificarUsuarios\" method=\"post\">");
        		out.println("<tr>");
        		
         		out.println("<td>"+rs.getString("nombre")+"</td>");
         		out.println("<td>"+rs.getString("apellidos")+"</td>");
         		out.println("<td>"+rs.getString("contrasena")+"</td>");
         		out.println("<td>"+rs.getString("correo")+"</td>");
         		out.println("<td>"+rs.getString("provincia")+"</td>");
         		
         		String CorreoClien = rs.getString("correo");
         		out.println("<input type=\"hidden\" name=\"CorreoClien\" value=\"CorreoClien\" >");
         	    
         		out.println("<td>"+"<button name=\"button\" value=\"button1\" class=\"btn btn-warning\">Modificar</button>"+"</td>");
         		out.println("<td>"+"<button onclick=\"borrarFila(this)\" type=\"submit\" name=\"button\" class=\"btn btn-danger\">Borrar</a>"+"</td>");
         		
         		out.println("</tr>");
         		out.println("</form>");
     		}
      		
     		out.println("</table>");
     		// cierre de la conexion
     		conexion.close();
   			}
   			else
      		// Error en la conexion
      		out.println("Error en la conexión");
			}
			catch (Exception e) {
   			// Error en algun momento.
   			out.println("Excepcion "+e);
   			e.printStackTrace();
			}
			%>
	  
	<div class="footer">
		<p>&copy; 2016 Wallapop, Inc.</p>
    </div>

    </div>  
  </body>
</html>
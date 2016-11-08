<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Inicio Usuarios</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/inicioCliente.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
  </head>

  <body>
    <div class="container">
      <div class="header clearfix">
		<img src="images/logo.png" alt="Error en la imagen">
        <h2 class="text-muted">WALLAPOP</h2>
		<p>Encuentra tu producto ideal</p>
      </div>



    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="images/fondo-productos.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Encuentra el producto que deseas</h1>
              <p>En Wallapop puedes buscar dentro de una amplia cantidad de categorías. Tenemos todo tipo de productos a vuestra disposición. ¡Encuentra el producto que estabas buscando!</p>
              <p><a class="btn btn-lg btn-primary" href="catalogo.jsp" role="button">Catálogo de productos</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="images/fondo-productos.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Visita tu perfil</h1>
              <p>Accede a tu perfil. Podrás modoficar tu información de usuario, dar de alta un producto que quieras vender, modificar los datos sobre un producto (así como darlo de baja o modificar su estado) o darte de baja de la aplicación.</p>
              <p><a class="btn btn-lg btn-primary" href="perfilCliente.jsp" role="button">Mi perfil</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="images/fondo-productos.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Comunicate con otros usuarios</h1>
              <p>Relacionate con otros usuarios a través del chat.</p>
              <p><a class="btn btn-lg btn-primary" href="Chat.jsp" role="button">Chat</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
	
	<table id="buscador">
		<tr><td id="celda1"><b>Búsqueda rápida de productos</b></td></tr> 
		<tr id="fila2">
		<td id="celda2">
		<span>Buscar producto:<input type="text" class="buscarProd"></span>
		
		<span><input type="button" value="Buscar" id="buscar" class="buscar btn btn-primary"></span><br><br>
		</td> 
		</tr>
		<tr ><td id="avanzada"><a class="avanzada" href="catalogo.html">+ Búsqueda avanzada</a></td></tr>
	</table><br><br>
	
	<table class="productos">
		<tr>
		<th></th>
		<th class="tituloTabla">Productos que puedes encontrar</th>
		<th></th>
		</tr>
		<tr>
			<td><img src="images/cajones.jpg" class="imagenesProductos" alt="Cajones blancos"></td>
			<td><img src="images/bici.jpg" class="imagenesProductos" alt="Bicicleta"></td>
			<td><img src="images/sofa.jpg" class="imagenesProductos" alt="Sofa de esquina"></td>
		</tr>
		<tr>
			<td><img src="images/camara.jpg" class="imagenesProductos" alt="Camara"></td>
			<td><img src="images/silla.jpg" class="imagenesProductos" alt="Silla"></td>
			<td><img src="images/raqueta.jpg" class="imagenesProductos" alt="Raqueta"></td>
		</tr>
	</table>
	

    
       <div class="footer">
        <p>&copy; 2016 Wallapop, Inc.</p>
      </div>

    </div>


   
   
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
   
    
    
  </body>
</html>

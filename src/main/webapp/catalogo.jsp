<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Catálogo de productos</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/catalogo.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
	$("#avanzada").click(function(){
		$("#busqueda_avanzada").toggle();
	});
	});
	</script>
  </head>

  <body>
  
    <div class="container" id="container">
		<div class="header clearfix">
			<img src="images/logo.png" alt="Error en la imagen">
			<h2 class="text-muted">WALLAPOP</h2>
			<p>Encuentra tu producto ideal</p>
		</div>
	
	<table id="buscador">
		<tr><td id="celda1"><b>Buscador de productos</b></td></tr> 
		<tr id="fila2">
		<td id="celda2">
		<span>Buscar producto:<input type="text" class="buscarProd"></span>
		
		<span><button value="Buscar" id="buscar" class="buscar btn btn-primary">Buscar</button></span><br><br>
		</td> 
		</tr> 
		<tr ><td id="avanzada"><a class="avanzada">+ Búsqueda avanzada</a></td></tr>
		
		<tr id="busqueda_avanzada">
		<td>
		<ul id="filtrado">
			<li>Categoria: <select class="categorias" id="categ">
					<option value="vacio" selected>Cualquier categoría</option>
					<option value="mobiliario">Mobiliario</option>
					<option value="vehiculos">Vehículos</option>
					<option value="moda">Moda y belleza</option>
					<option value="electronica">Electrónica</option>
					<option value="ocio">Ocio y deportes</option>
					<option value="otros">Otros</option>
			</select></li>
			<li>Ciudad: <select class="provincias" id="prov">
					<option value="vacio" selected>Cualquier provincia</option>
					<option value="Álava">Álava</option>
					<option value="Albacete">Albacete</option>
					<option value="Alicante">Alicante</option>
					<option value="Almería">Almería</option>
					<option value="Asturias">Asturias</option>
					<option value="Ávila">Ávila</option>
					<option value="Badajoz">Badajoz</option>
					<option value="Barcelona">Barcelona</option>
					<option value="Burgos">Burgos</option>
					<option value="Cáceres">Cáceres</option>
					<option value="Cádiz">Cádiz</option>
					<option value="Cantabria">Cantabria</option>
					<option value="Castellón">Castellón</option>
					<option value="Ciudad Real">Ciudad Real</option>
					<option value="Córdoba">Córdoba</option>
					<option value="La Coruña">La Coruña</option>
					<option value="Cuenca">Cuenca</option>
					<option value="Gerona">Gerona</option>
					<option value="Granada">Granada</option>
					<option value="Guadalajara">Guadalajara</option>
					<option value="Guipúzcoa">Guipúzcoa</option>
					<option value="Huelva">Huelva</option>
					<option value="Huesca">Huesca</option>
					<option value="Islas Baleares">Islas Baleares</option>
					<option value="Jaén">Jaén</option>
					<option value="León">León</option>
					<option value="Lérida">Lérida</option>
					<option value="Lugo">Lugo</option>
					<option value="Madrid">Madrid</option>
					<option value="Málaga">Málaga</option>
					<option value="Murcia">Murcia</option>
					<option value="Navarra">Navarra</option>
					<option value="Orense">Orense</option>
					<option value="Palencia">Palencia</option>
					<option value="Las Palmas">Las Palmas</option>
					<option value="Pontevedra">Pontevedra</option>
					<option value="La Rioja">La Rioja</option>
					<option value="Salamanca">Salamanca</option>
					<option value="Santa Cruz de Tenerife">Santa Cruz de Tenerife</option>
					<option value="Segovia">Segovia</option>
					<option value="Sevilla">Sevilla</option>
					<option value="Soria">Soria</option>
					<option value="Tarragona">Tarragona</option>
					<option value="Teruel">Teruel</option>
					<option value="Toledo">Toledo</option>
					<option value="Valencia">Valencia</option>
					<option value="Valladolid">Valladolid</option>
					<option value="Vizcaya">Vizcaya</option>
					<option value="Zamora">Zamora</option>
					<option value="Zaragoza">Zaragoza</option>
					<option value="Ceuta">Ceuta</option>
					<option value="Melilla">Melilla</option>		
			</select></li>
			<li>Vendedor: <input type="text" class="vendedor"></li>
			<li>Título: <input type="text" class="tituloAvanzada"></li>
			<li>Descripción: <input type="text" class="descripcionAvanzada"></li>
		</ul> 
		</td>
	</tr>
	</table><br><br>
	
					<div class='fav' id='fav1'> 
						<h4 class='tituloFav'>Cajonera Blanca IKEA</h4>
						<p><b>Categoria:</b>&nbsp;&nbsp;&nbsp;<span class="categoria">Mobiliario</span><br><br></p>
						<p><b>Descripcion:</b>&nbsp;&nbsp;&nbsp;<span class="descripcion">Mueble blanco de IKEA con cinco cajones.</span><br><br></p>
						<img src="images/cajones.jpg" class="img-circle imagenesProductos" alt="Cajones blancos">
						<p><b>Precio:</b>&nbsp;&nbsp;&nbsp;<span class="precio">45</span><br><br></p>
						<p><b>Estado:</b>&nbsp;&nbsp;&nbsp;<span class="estado">Vendido</span></p>
					</div> 
		
					<div class='fav' id='fav2'>
						<h4 class='tituloFav'>Bicicleta de carretera</h4>
						<p><b>Categoria:</b>&nbsp;&nbsp;&nbsp;<span class="categoria">Vehiculos</span><br><br></p>
						<p><b>Descripcion:</b>&nbsp;&nbsp;&nbsp;<span class="descripcion">Bicicleta de carretera Elektra Race.</span><br><br></p>
						<img src="images/bici.jpg" class="img-circle imagenesProductos" alt="Bicicleta">
						<p><b>Precio:</b>&nbsp;&nbsp;&nbsp;<span class="precio">340</span><br><br></p>
						<p><b>Estado:</b>&nbsp;&nbsp;&nbsp;<span class="estado">Disponible</span><br><br></p>
					</div> 
					
					<div class='fav' id='fav3'> 
						<h4 class='tituloFav'>Sofa de esquina</h4>
						<p><b>Categoria:</b>&nbsp;&nbsp;&nbsp;<span class="categoria">Mobiliario</span><br><br></p>
						<p><b>Descripcion:</b>&nbsp;&nbsp;&nbsp;<span class="descripcion">Sofa blanco de esquina con almacenaje.</span><br><br></p>
						<img src="images/sofa.jpg" class="img-circle imagenesProductos" alt="Sofa de esquina">
						<p><b>Precio:</b>&nbsp;&nbsp;&nbsp;<span class="precio">190</span><br><br></p>
						<p><b>Estado:</b>&nbsp;&nbsp;&nbsp;<span class="estado">Disponible</span><br><br></p>						
					</div>
					
					<div class='fav' id='fav4'> 
						<h4 class='tituloFav'>Iphone 4s</h4>
						<p><b>Categoria:</b>&nbsp;&nbsp;&nbsp;<span class="categoria">Electrónica</span><br><br></p>
						<p><b>Descripcion:</b>&nbsp;&nbsp;&nbsp;<span class="descripcion">Iphone 4s con cargador y auriculares incluidos.</span><br><br></p>
						<img src="images/iphone.jpg" class="img-circle imagenesProductos" alt="iphone">
						<p><b>Precio:</b>&nbsp;&nbsp;&nbsp;<span class="precio">120</span><br><br></p>
						<p><b>Estado:</b>&nbsp;&nbsp;&nbsp;<span class="estado">Disponible</span><br><br></p>						
					</div>
					
					<div class='fav' id='fav5'> 
						<h4 class='tituloFav'>Bolso Miau</h4>
						<p><b>Categoria:</b>&nbsp;&nbsp;&nbsp;<span class="categoria">Moda y belleza</span><br><br></p>
						<p><b>Descripcion:</b>&nbsp;&nbsp;&nbsp;<span class="descripcion">Bolso de piel de serpiente valorado en 750 euros.</span><br><br></p>
						<img src="images/bolso.jpg" class="img-circle imagenesProductos" alt="Sofa de esquina">
						<p><b>Precio:</b>&nbsp;&nbsp;&nbsp;<span class="precio">180</span><br><br></p>
						<p><b>Estado:</b>&nbsp;&nbsp;&nbsp;<span class="estado">Vendido</span><br><br></p>						
					</div>
					
					<div class='fav' id='fav6'> 
						<h4 class='tituloFav'>Cachimba</h4>
						<p><b>Categoria:</b>&nbsp;&nbsp;&nbsp;<span class="categoria">Otros</span><br><br></p>
						<p><b>Descripcion:</b>&nbsp;&nbsp;&nbsp;<span class="descripcion">Cachimba de 50cm traida de Marruecos.</span><br><br></p>
						<img src="images/cachimba.jpg" class="img-circle imagenesProductos" alt="Sofa de esquina">
						<p><b>Precio:</b>&nbsp;&nbsp;&nbsp;<span class="precio">65</span><br><br></p>
						<p><b>Estado:</b>&nbsp;&nbsp;&nbsp;<span class="estado">Disponible</span><br><br></p>						
					</div>
					
					<br><br>
	
		<div class="footer">
			<p>&copy; 2016 Wallapop, Inc.</p>
		</div>

    </div> 
  </body>
</html>
    
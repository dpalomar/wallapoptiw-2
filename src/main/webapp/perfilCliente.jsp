<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/icono.ico">
    <title>WALLAPOP: Perfil de usuario</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/perfilCliente.css" rel="stylesheet">
	<link href="css/login.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<script type="text/javascript">

	/*Distintas pantallas que mostraremos con las opciones del menu*/					
	function cambiaPantalla(menu){
		var nombre = document.getElementById(menu).id; 
		var estilo = document.getElementById(menu).style.display;
		if(estilo=="none"){
			document.getElementById(menu).style.visibility='hidden';
		}
		/*Mostramos todo lo relacionado con la informaciÃ³n personal*/
		if(menu=="menu1"){
			document.getElementById("informacionPersonal").style.visibility='visible';
			document.getElementById("informacionPersonal").style.display='block';
			document.getElementById("menu1").className = 'active';
			document.getElementById("menu2").className = 'noactive';
			document.getElementById("productos").style.display='none';
		}
		/*Mostramos todo lo relacionado con productos*/
		if(menu=="menu2"){
			document.getElementById("productos").style.visibility='visible';
			document.getElementById("productos").style.display='block';
			document.getElementById("menu2").className = 'active';
			document.getElementById("menu1").className = 'noactive';
			document.getElementById("informacionPersonal").style.display='none';
		}		
		
	}
	
	function editar(fav){
		$(fav).css({"border":"dashed 2px #DF0101"});
		$("#edit1").css({"visibility":"hidden"});
		$("#con1").css({"visibility":"visible"});
		
		document.getElementById('name').readOnly=false;
		document.getElementById('apellido').readOnly=false;
		document.getElementById('ciudad').readOnly=false;
		document.getElementById('correo').readOnly=false;
		document.getElementById('pass').readOnly=false;
	};
	
	function confirmar(fav){
		if(validacion() == false){
			return false;
		}else{
		$("#edit1").css({"visibility":"visible"});
		$("#con1").css({"visibility":"hidden"});
		$(fav).css({"border":"dashed 2px white"});
		document.getElementById('name').readOnly=true;
		document.getElementById('apellido').readOnly=true;
		document.getElementById('ciudad').readOnly=true;
		document.getElementById('correo').readOnly=true;
		document.getElementById('pass').readOnly=true;
		}
	};
	
	function validacion(){
	var nombre = document.getElementById('name').value;
	var apellido = document.getElementById('apellido').value;
	var ciudad = document.getElementById('ciudad').value;
	var email = document.getElementById('correo').value;
	var contras1 = document.getElementById('pass').value;
	var expresion = /^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
	
	if (nombre.length == 0){
		alert("Por favor introduce tu nombre");
		return false;
	}
	if (apellido.length == 0){
		alert("Por favor introduce tus apellidos");
		return false;
	}
	if (ciudad.length == 0){
		alert("Por favor introduce tu ciudad de residencia");
		return false;
	}
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
	}
	
	function editarProd(fav,boton1, boton2){
		$(fav).css({"border":"dashed 2px #DF0101"});
		$(boton1).css({"visibility":"hidden"});
		$(boton2).css({"visibility":"visible"});
		if(boton1 == edit2){
		document.getElementById('categoria1').readOnly=false;
		document.getElementById('descripcion1').readOnly=false;
		document.getElementById('precio1').readOnly=false;
		document.getElementById('estado1').readOnly=false;
		}
		else if(boton1 == edit3){
		document.getElementById('categoria2').readOnly=false;
		document.getElementById('descripcion2').readOnly=false;
		document.getElementById('precio2').readOnly=false;
		document.getElementById('estado2').readOnly=false;
		}else if(boton1 == edit4){
		document.getElementById('categoria3').readOnly=false;
		document.getElementById('descripcion3').readOnly=false;
		document.getElementById('precio3').readOnly=false;
		document.getElementById('estado3').readOnly=false;
		}else if (boton1 == edit5){
		document.getElementById('categoria5').readOnly=false;
		document.getElementById('descripcion5').readOnly=false;
		document.getElementById('precio5').readOnly=false;
		document.getElementById('estado5').readOnly=false;
		}
		
	};
	
	function confirmarProd(fav,boton1, boton2){
		$(boton1).css({"visibility":"visible"});
		$(boton2).css({"visibility":"hidden"});
		$(fav).css({"border":"solid 2px #A9D0F5"});
		if(boton1 == edit2){
		document.getElementById('categoria1').readOnly=true;
		document.getElementById('descripcion1').readOnly=true;
		document.getElementById('precio1').readOnly=true;
		document.getElementById('estado1').readOnly=true;
		}
		else if(boton1 == edit3){
		document.getElementById('categoria2').readOnly=true;
		document.getElementById('descripcion2').readOnly=true;
		document.getElementById('precio2').readOnly=true;
		document.getElementById('estado2').readOnly=true;
		}else if(boton1 == edit4){
		document.getElementById('categoria3').readOnly=true;
		document.getElementById('descripcion3').readOnly=true;
		document.getElementById('precio3').readOnly=true;
		document.getElementById('estado3').readOnly=true;
		}else if(boton1 == edit5){
		document.getElementById('categoria5').readOnly=true;
		document.getElementById('descripcion5').readOnly=true;
		document.getElementById('precio5').readOnly=true;
		document.getElementById('estado5').readOnly=true;
		}
	};
	
	$(document).ready(function(){
	$("#anadir").click(function(){
		$("#tabla2").toggle();
	});
		document.getElementById('categoria1').value="Mobiliario";
		document.getElementById('descripcion1').value="Mueble blanco de IKEA con cinco cajones.";
		document.getElementById('precio1').value="45 euros";
		document.getElementById('estado1').value="Vendido";
		
		document.getElementById('categoria2').value="Vehiculos";
		document.getElementById('descripcion2').value="Bicicleta de carretera Elektra Race.";
		document.getElementById('precio2').value="340 euros";
		document.getElementById('estado2').value="Disponible";
		
		document.getElementById('categoria3').value="Mobiliario";
		document.getElementById('descripcion3').value="Sofa blanco de esquina con almacenaje.";
		document.getElementById('precio3').value="190 euros";
		document.getElementById('estado3').value="Disponible";
	
	});
		
	$(document).ready(function(){
	var iCnt = 4;
	$("#validar").click(function(){
		var titulo = $(".tituloProducto").val();
		var categoria = $("#categoria4").val();
		var descripcion = $("#descripcion4").val();
		var precio = $("#precio4").val();
		var estado = $("#estado4").val();
		var imagen = $("#imagen4").val();
		if( titulo == "" ){
			alert("Introduzca un título para el nuevo producto");
			return false;
		}
		if(categoria == ""){
			alert("Introduzca una categoria para el nuevo producto");
			return false;
		}
		if( descripcion == ""){
			alert("Introduzca una descripción para el nuevo producto");
			return false;
		}
		if(precio == ""){
			alert("Introduzca un precio para el nuevo producto");
			return false;
		}
		if(estado == ""){
			alert("Introduzca un estado para el nuevo producto");
			return false;
		}
 
		iCnt = iCnt + 1;
		var container = $(document.createElement('div')).attr('class', 'fav').attr('id', 'fav' + iCnt);
		
		$(container).prepend('<button class="elim btn btn-warning" id=edit'+ iCnt + ' '  + 'onclick="editarProd(fav' + iCnt + ' '+',edit' + iCnt + ' '+',con' + iCnt + ' '+')">Editar<\/button>');
		$(container).prepend('<button class="cont btn btn-success" id=con'+ iCnt + ' '  + 'onclick="confirmarProd(fav' + iCnt + ' '+',edit' + iCnt + ' '+',con' + iCnt + ' '+')">Confirmar<\/button>');
		
		$(container).append('<h4 class="tituloFav">'+ titulo + '<\/h4>');
		$(container).append('<p>Categoria:<input type="text" class="categoria" id=categoria' + iCnt + ' '  + 'readonly value='+categoria+'><br><br><\/p>');
		$(container).append('<p>Descripcion:<input type="text" class="descripcion" id=descripcion' + iCnt + ' '  + 'readonly value='+descripcion+'><br><br><\/p>');
		$(container).append('');
		$(container).append('<p>Precio:<input type="text" class="precio" id=precio' + iCnt + ' '  + 'readonly value='+precio+'><br><br><\/p>');
		$(container).append('<p>Estado:<input type="text" class="estado" id=estado' + iCnt + ' '  + 'readonly value='+estado+'><br><br><\/p>');
		$(container).append('<button class="btn btn-danger eliminarProducto" onclick="eliminarProd(fav' + iCnt + ' '+',edit' + iCnt + ' '+',con' + iCnt + ' '+')">Dar de baja el producto<\/button>');
		$('#tabla2').before(container);
		$("#tabla2").toggle();
		
		
	});
	});
	
	
	
		
		
	
	function eliminar(){
	confirm("¿Esta seguro que quiere darse de baja en la aplicación? Al hacerlo se le eliminaran automáticamente los productos que tiene puestos en su perfil.");
	location.href = "login.jsp"
	}
	
	
	function eliminarProd(nombre1,nombre2,nombre3){
	confirm("¿Esta seguro que quiere dar de baja el producto?");
	$(nombre1).remove();
	$(nombre2).remove();
	$(nombre3).remove();	
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
			<li  class="active" id='menu1' onclick="cambiaPantalla('menu1')" ><a href="#">Información Personal</a></li>		
			<li  class="noactive" id='menu2' onclick="cambiaPantalla('menu2')"><a href="#">Mis productos</a></li>	
		</ul>
	</div>	
		
	<table id='tabla'>
		<tr>
			<td>
				<div id='informacionPersonal'>
					<h1 class='titulo'>INFORMACIÓN PERSONAL</h1>
					
					<button class='elim btn btn-warning' id='edit1' onclick='editar(datospersonales); editar(datosusuario);'>Editar</button>
					<button class='cont btn btn-success' id='con1' onclick="validacion(); confirmar(datospersonales);confirmar(datosusuario);">Confirmar</button>
					
					<h3 class='subtitulo'>Datos personales</h3>
						
					<div id='datospersonales'>
						<p class='etiquetas'><b>Nombre:&nbsp;&nbsp;&nbsp;</b><input class="nombrecompleto" type="text" name="nombrecompleto" tabindex="1" id='name' readonly="readonly"><br><br></p>
						<p class='etiquetas'><b>Apellidos:&nbsp;&nbsp;&nbsp;</b><input class="apellidos" type="text" name="apellidos" tabindex="2" id='apellido' readonly="readonly"><br><br></p>
						<p class='etiquetas'><b>Ciudad de residencia:&nbsp;</b><input type="text" name="ciudad" id="ciudad" tabindex="3" readonly="readonly"><br></p>
					</div>
					
					<div class='separacion'>
					<p>___________________________________________________________________</p>
					</div>
					
					<h3 class='subtitulo'>Datos de usuario</h3>
						
					<div id='datosusuario'>
						<p class='etiquetas'><b>E-mail:&nbsp;&nbsp;&nbsp;</b><input type="text" class="email" tabindex="4" id='correo' readonly="readonly"><br><br></p>
						<p class='etiquetas' ><b>Contraseña:&nbsp;</b><input class="contrasena" name="contrasena" type="text" tabindex="5" id ='pass' readonly="readonly"><br><br></p>
					</div>
					<button class='btn btn-danger borrar' onclick="eliminar()">Darse de baja en la aplicación</button>
				</div>
					
			
	
				<div class="oculto" id="productos">
					<h1 class='titulo'>MIS PRODUCTOS</h1>
					<p class='etiqueta'>A continuacion, se mostraran las productos que tiene puestos en venta. </p>
					<p class='etiqueta'>Si desea modificar o dar de baja un producto pinche en editar.</p>
					<p class='etiqueta'>Si desea añadir un nuevo producto pinche <button class="anadir btn btn-default" id="anadir">aquí.</button></p>
					
					
						
					
					
					<button class='elim btn btn-warning' id='edit2' onclick='editarProd(fav2,edit2,con2)'>Editar</button>
					<button class='cont btn btn-success' id='con2' onclick='confirmarProd(fav2,edit2,con2);'>Confirmar</button>
					<div class='fav' id='fav2'> 
						<h4 class='tituloFav'>Cajonera Blanca IKEA</h4>
						<p>Categoria:&nbsp;&nbsp;&nbsp;<input type="text" class="categoria" id="categoria1" readonly><br><br></p>
						<p>Descripcion:&nbsp;&nbsp;&nbsp;<input type="text" class="descripcion" id="descripcion1" readonly><br><br></p>
						<img src="images/cajones.jpg" class="img-circle imagenesProductos" alt="Cajones blancos">
						<p>Precio:&nbsp;&nbsp;&nbsp;<input type="text" class="precio" id="precio1" readonly><br><br></p>
						<p>Estado:&nbsp;&nbsp;&nbsp;<input type="text" class="estado" id="estado1" readonly><br><br></p>
						<button class='btn btn-danger eliminarProducto' onclick="eliminarProd(fav2,edit2,con2)">Dar de baja el producto</button>
					</div> 
					
					<button class='elim btn btn-warning' id='edit3' onclick='editarProd(fav3,edit3,con3)'>Editar</button>
					<button class='cont btn btn-success' id='con3' onclick="confirmarProd(fav3,edit3,con3);">Confirmar</button>
					<div class='fav' id='fav3'>
						<h4 class='tituloFav'>Bicicleta de carretera</h4>
						<p>Categoria:&nbsp;&nbsp;&nbsp;<input type="text" class="categoria" id="categoria2" readonly="readonly"><br><br></p>
						<p>Descripcion:&nbsp;&nbsp;&nbsp;<input type="text" class="descripcion" id="descripcion2" readonly="readonly"><br><br></p>
						<img src="images/bici.jpg" class="img-circle imagenesProductos" alt="Bicicleta">
						<p>Precio:&nbsp;&nbsp;&nbsp;<input type="text" class="precio" id="precio2" readonly="readonly"><br><br></p>
						<p>Estado:&nbsp;&nbsp;&nbsp;<input type="text" class="estado" id="estado2" readonly="readonly"><br><br></p>
						<button class='btn btn-danger eliminarProducto' onclick="eliminarProd(fav3,edit3,con3)">Dar de baja el producto</button>
					</div> 
					
					<button class='elim btn btn-warning' id='edit4' onclick='editarProd(fav4,edit4,con4)'>Editar</button>
					<button class='cont btn btn-success' id='con4' onclick="confirmarProd(fav4,edit4, con4);">Confirmar</button>
					<div class='fav' id='fav4'> 
						<h4 class='tituloFav'>Sofa de esquina</h4>
						<p>Categoria:&nbsp;&nbsp;&nbsp;<input type="text" class="categoria" id="categoria3" readonly="readonly"><br><br></p>
						<p>Descripcion:&nbsp;&nbsp;&nbsp;<input type="text" class="descripcion" id="descripcion3" readonly="readonly"><br><br></p>
						<img src="images/sofa.jpg" class="img-circle imagenesProductos" alt="Sofa de esquina">
						<p>Precio:&nbsp;&nbsp;&nbsp;<input type="text" class="precio" id="precio3" readonly="readonly"><br><br></p>
						<p>Estado:&nbsp;&nbsp;&nbsp;<input type="text" class="estado" id="estado3" readonly="readonly"><br><br></p>						
						<button class='btn btn-danger eliminarProducto' onclick="eliminarProd(fav4,edit4,con4)">Dar de baja el producto</button>
					</div><br><br>
					<form id="formAlta" action="productos?accion=alta" method="post" >
						<table id="tabla2"> 
								<tr id="fila1"><td id="celda1"><b>Añade un nuevo producto</b></td></tr> 
								<tr id="fila2"> 
								<td><br>
									<label>Titulo&nbsp;&nbsp;&nbsp;
										<input type="text" name="titulo" class="tituloProducto"><br><br></label>
									<label>Categori­a&nbsp;&nbsp;&nbsp;
										<input type="text" name="categoria" class="categoria" id="categoria4"><br><br></label>
									<label>Descripcion&nbsp;&nbsp;&nbsp;
										<input type="text" name="descripcion" class="descripcion" id="descripcion4"><br><br></label>
									<label>Imagen&nbsp;&nbsp;&nbsp;
										<input id="imagen4" name="imagen" type="file" accept="image/*"><br><br></label>
									<label>Precio&nbsp;&nbsp;&nbsp;
										<input type="text" name="precio" class="precio" id="precio4"><br><br></label>
									<label>Estado&nbsp;&nbsp;&nbsp;
										<input type="text" name="estado" class="estado" id="estado4"><br><br></label>
									<label>
										<button type="submit" class='validar btn btn-info' id='validar'>Añadir</button></label><br>
								</td>   
								</tr> 
						</table>
					</form>
					
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
	    	    
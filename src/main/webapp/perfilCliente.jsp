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
	<script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
	<script>

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
		alert("Por favor introduce tu direcciÃ³n de correo electrÃ³nico");
		return false;
	}
	if (!expresion.test(email)){
		alert("Por favor introduce una direcciÃ³n de correo electrÃ³nico vÃ¡lida");
		return false;
	}
	
	if (contras1.length == 0){
		alert("Por favor introduce tu contraseÃ±a");
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
		}
	};
	
	$(document).ready(function(){
	$(".anadir").click(function(){
		$("#tabla2").toggle();
	});
	});
		
	$(document).ready(function(){	
	$("#validar").click(function(){
		var titulo = $(".tituloProducto").val();
		var categoria = $(".categoria").val();
		var descripcion = $(".descripcion").val();
		var precio = $(".precio").val();
		var estado = $(".estado").val();
		if( titulo == "" ){
			$(".tituloProducto").focus().after("<span class='error'>Introduzca un tÃ­tulo para el nuevo producto</span>");
			return false;
		}else if(categoria = ""){
			$(".categoria").focus().after("<span class='error'>Introduzca un categoria para el nuevo producto</span>");
			return false;
		}else if( descripcion == ""){
			$(".descripcion").focus().after("<span class='error'>Introduzca una descripciÃ³n para el nuevo producto</span>");
			return false;
		}else if(precio == ""){
			$(".precio").focus().after("<span class='error'>Introduzca un precio para el nuevo producto</span>");
			return false;
		}else if(estado == ""){
			$(".precio").focus().after("<span class='error'>Introduzca un estado para el nuevo producto</span>");
			return false;
		}
	});
	});
	
	
	$(document).ready(function(){ 
		
		document.getElementById('categoria1').value="Mobiliario";
		document.getElementById('descripcion1').value="Mueble blanco de IKEA con cinco cajones.";
		document.getElementById('precio1').value="45â¬";
		document.getElementById('estado1').value="Vendido";
		
		document.getElementById('categoria2').value="Vehiculos";
		document.getElementById('descripcion2').value="Bicicleta de carretera Elektra Race.";
		document.getElementById('precio2').value="340â¬";
		document.getElementById('estado2').value="Disponible";
		
		document.getElementById('categoria3').value="Mobiliario";
		document.getElementById('descripcion3').value="SofÃ¡ blanco de esquina con almacenaje.";
		document.getElementById('precio3').value="190â¬";
		document.getElementById('estado3').value="Disponible";
	
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

	<nav>  <!--MENÃ IZQUIERDO-->
		<ul id="opcionesmenu" class="nav nav-pills nav-stacked">
			<li  class="active" id='menu1' onclick="cambiaPantalla('menu1')" ><a href="#">InformaciÃ³n Personal</a></li>		
			<li  class="noactive" id='menu2' onclick="cambiaPantalla('menu2')"><a href="#">Mis productos</a></li>	
		</ul>
	</nav>	
		
	<table id='tabla'>
		<tr>
			<td>
				<div id='informacionPersonal'>
					<h1 class='titulo'>INFORMACIÃN PERSONAL</h1>
					
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
						<p class='etiquetas' ><b>ContraseÃ±a:&nbsp;</b><input class="contraseÃ±a" name="contraseÃ±a" type="text" tabindex="5" id ='pass' readonly="readonly"><br><br></p>
					</div>
				</div>
					
					
				<div class="oculto" id="productos">
					<h1 class='titulo'>MIS PRODUCTOS</h1>
					<p class='etiqueta'>A continuaciÃ³n, se mostrarÃ¡n las productos que tiene puestos en venta. </p>
					<p class='etiqueta'>Si desea modificar o dar de baja un producto pinche en editar.</p>
					<p class='etiqueta'>Si desea aÃ±adir un nuevo producto pinche <a role="button" class="anadir btn btn-default" id="anadir">aquÃ­.</a></p>
					
					
					<button class='elim btn btn-warning' id='edit2' onclick='editarProd(fav2,edit2,con2)'>Editar</button>
					<button class='cont btn btn-success' id='con2' onclick='confirmarProd(fav2,edit2,con2);'>Confirmar</button>
					<div class='fav' id='fav2'> 
						<h4 class='tituloFav'>Cajonera Blanca IKEA</h4>
						<p>CategorÃ­a:&nbsp;&nbsp;&nbsp;<input type="text" class="categoria" id="categoria1" readonly><br><br></p>
						<p>DescripciÃ³n:&nbsp;&nbsp;&nbsp;<input type="text" class="descripcion" id="descripcion1" readonly><br><br></p>
						<img src="images/cajones.jpg" class="img-circle imagenesProductos" alt="Cajones blancos">
						<p>Precio:&nbsp;&nbsp;&nbsp;<input type="text" class="precio" id="precio1" readonly><br><br></p>
						<p>Estado:&nbsp;&nbsp;&nbsp;<input type="text" class="estado" id="estado1" readonly><br><br></p>
					</div> 
					
					<button class='elim btn btn-warning' id='edit3' onclick='editarProd(fav3,edit3,con3)'>Editar</button>
					<button class='cont btn btn-success' id='con3' onclick="confirmarProd(fav3,edit3,con3);">Confirmar</button>
					<div class='fav' id='fav3'>
						<h4 class='tituloFav'>Bicicleta de carretera</h4>
						<p>CategorÃ­a&nbsp;&nbsp;&nbsp;<input type="text" class="categoria" id="categoria2" readonly="readonly"><br><br></p>
						<p>DescripciÃ³n&nbsp;&nbsp;&nbsp;<input type="text" class="descripcion" id="descripcion2" readonly="readonly"><br><br></p>
						<img src="images/bici.jpg" class="img-circle imagenesProductos" alt="Bicicleta">
						<p>Precio&nbsp;&nbsp;&nbsp;<input type="text" class="precio" id="precio2" readonly="readonly"><br><br></p>
						<p>Estado&nbsp;&nbsp;&nbsp;<input type="text" class="estado" id="estado2" readonly="readonly"><br><br></p>
					</div> 
					
					<button class='elim btn btn-warning' id='edit4' onclick='editarProd(fav4,edit4,con4)'>Editar</button>
					<button class='cont btn btn-success' id='con4' onclick="confirmarProd(fav4,edit4, con4);">Confirmar</button>
					<div class='fav' id='fav4'> 
						<h4 class='tituloFav'>SofÃ¡ de esquina</h4>
						<p>CategorÃ­a&nbsp;&nbsp;&nbsp;<input type="text" class="categoria" id="categoria3" readonly="readonly"><br><br></p>
						<p>DescripciÃ³n&nbsp;&nbsp;&nbsp;<input type="text" class="descripcion" id="descripcion3" readonly="readonly"><br><br></p>
						<img src="images/sofa.jpg" class="img-circle imagenesProductos" alt="Sofa de esquina">
						<p>Precio&nbsp;&nbsp;&nbsp;<input type="text" class="precio" id="precio3" readonly="readonly"><br><br></p>
						<p>Estado&nbsp;&nbsp;&nbsp;<input type="text" class="estado" id="estado3" readonly="readonly"><br><br></p>						
					</div><br><br>
					
					<form id="formulario">
						<table id="tabla2"> 
							<tr id="fila1"><td id="celda1"><b>AÃ±ade un nuevo producto</b></td></tr> 
							<tr id="fila2"> 
							<td><br>
								<label>Titulo&nbsp;&nbsp;&nbsp;<input type="text" class="tituloProducto"><br><br></label>
								<label>CategorÃ­a&nbsp;&nbsp;&nbsp;<input type="text" class="categoria" id="categoria4"><br><br></label>
								<label>DescripciÃ³n&nbsp;&nbsp;&nbsp;<input type="text" class="descripcion" id="descripcion4"><br><br></label>
								<label>Imagen&nbsp;&nbsp;&nbsp;<input type="text" class="imagen" id="imagen4"><br><br></label>
								<label>Precio&nbsp;&nbsp;&nbsp;<input type="text" class="precio" id="precio4"><br><br></label>
								<label>Estado&nbsp;&nbsp;&nbsp;<input type="text" class="estado" id="estado"><br><br></label>
								<label><button class='validar btn btn-info' id='validar'>AÃ±adir</button></label><br>
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
    
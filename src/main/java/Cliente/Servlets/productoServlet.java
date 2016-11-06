package Cliente.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;


import Cliente.DAOS.productoDAO;
import Cliente.DAOS.productoDAOImp;
import Cliente.Dominios.productoDominio;

/**
 * Servlet implementation class productoServlet
 */
@WebServlet("/productos")
public class productoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private ServletConfig config;
	private productoDAO daoProducto;
	private Connection con;
	private static final String SECCION = "SECCION", ACCION = "ACCION", TRUE = "TRUE",
			ALTA_SATISFACTORIA = "ALTA_SATISFACTORIA", 
			ALTA_PRODUCTO="ALTA_PRODUCTO",EDITAR_PRODUCTO="EDITAR_PRODUCTO",
			BORRAR_PRODUCTO="BORRAR_PRODUCTO",LISTAR_PRODUCTO="LISTAR_PRODUCTO";
	@PersistenceContext(unitName="wallapoptiw")
	EntityManager em;
	@Resource
	UserTransaction ut;
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
    public productoServlet() {
        super();    
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
  		//this.config = config;
  		
  		daoProducto = new productoDAOImp();
  		daoProducto.setConexion(em);
  		daoProducto.setTransaction(ut);
  		
  		productoDominio p1 = new productoDominio();
  		productoDominio p2 = new productoDominio();
   	 	productoDominio p3 = new productoDominio();
   	 
   	 	p1.setTitulo("Cajonera Blanca IKEA");
   	 	p1.setCategoria("Mobiliario");
   	 	p1.setDescripcion("Mueble blanco de IKEA con cinco cajones");
   	 	p1.setPrecio(45);
   	 	p1.setEstado("Vendido");
   	 
   	 	p2.setTitulo("Bicicleta de carretera");
   	 	p2.setCategoria("Vehiculos");
   	 	p2.setDescripcion("Bicicleta de carretera Elektra Race");
   	 	p2.setPrecio(340);
   	 	p2.setEstado("Disponible");
   	 
   	 	p3.setTitulo("Sofa de esquina");
   	 	p3.setCategoria("Mobiliario");
   	 	p3.setDescripcion("Sofa blanco de esquina con almacenaje");
   	 	p3.setPrecio(190);
   	 	p3.setEstado("Disponible");
   	 	
   	 try {
 	 	ut.begin();
 	 	
 	 	em.persist(p1);
 	 	em.persist(p2);
 	 	em.persist(p3);
 	 	
 	 	ut.commit();
 	 
 	 } catch (Exception e1) {
 	 // TODO Auto-generated catch block
 	 e1.printStackTrace();
 	 }
 	 		
 	 
 	 }
  	
    
    public void destroy() {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute(SECCION, LISTAR_PRODUCTO);
		RequestDispatcher rd = request.getRequestDispatcher("perfilCliente.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter(ACCION);
		
		if(accion != null) {
			try {
				if (accion.equalsIgnoreCase(ALTA_PRODUCTO)) {
					this.AltaProducto(request);
				}/*else if (accion.equalsIgnoreCase(EDITAR)) {
					Usuario usuario = recuperarDatosUsuario(request);
					request.setAttribute("usuario", usuario);
					pagina = "/editarusuario.jsp";
				
				}else if (accion.equalsIgnoreCase(BORRAR)) {
					Usuario usuario = recuperarDatosUsuario(request);
					pagina = "/login.jsp";
					borrarUsuario(usuario);
				}*/
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		request.setAttribute(SECCION, LISTAR_PRODUCTO);
		RequestDispatcher rd = request.getRequestDispatcher("perfilCliente.jsp");
		rd.forward(request, response);
	}

	private void AltaProducto(HttpServletRequest request) throws SecurityException, IllegalStateException, SQLException, javax.transaction.RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException {
		productoDominio nuevoProducto = this.getProductoAlta(request);
		if(this.IsValid(nuevoProducto)){
			daoProducto.crearProducto(nuevoProducto);
			request.setAttribute(ALTA_SATISFACTORIA, TRUE);
		} 
	}


	private productoDominio getProductoAlta(HttpServletRequest request) {
		return null;
	}

	private boolean IsValid(productoDominio produc) {
		return true;
	}

}

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
import Cliente.Dominios.clienteDominio;
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
	private static final String SECCION = "SECCION", ACCION = "accion", TRUE = "TRUE",
			ALTA_SATISFACTORIA = "ALTA_SATISFACTORIA", 
			ALTA_PRODUCTO="alta",EDITAR_PRODUCTO="EDITAR_PRODUCTO",
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
		RequestDispatcher rd = request.getRequestDispatcher("misProductos.jsp");
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
		RequestDispatcher rd = request.getRequestDispatcher("misProductos.jsp");
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
		productoDominio producto = new productoDominio();
		clienteDominio usuario = (clienteDominio)request.getSession().getAttribute("usuario");
		
		producto.setTitulo(request.getParameter("titulo"));
		producto.setCategoria(request.getParameter("categoria"));
		producto.setDescripcion(request.getParameter("descripcion"));
		producto.setPrecio(request.getParameter("precio"));
		producto.setEstado(request.getParameter("estado"));
		
		clienteDominio cliente = new clienteDominio();
		cliente.setId(usuario.getId());
		producto.setDuenoProducto(cliente);
		
		return producto;
	}

	private boolean IsValid(productoDominio produc) {
		return true;
	}

}

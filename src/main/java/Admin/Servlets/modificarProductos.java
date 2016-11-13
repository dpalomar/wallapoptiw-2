package Admin.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

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
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;


import Cliente.DAOS.productoDAO;
import Cliente.DAOS.productoDAOImp;
import Cliente.Dominios.clienteDominio;
import Cliente.Dominios.productoDominio;

/**
 * Servlet implementation class modificarProductos
 */
@WebServlet("/adminproducto")
public class modificarProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ACCION = "accion",
			EDITAR ="editar", BORRAR ="borrar";
	
	private productoDAO daoProducto;
	private Connection con;
    @PersistenceContext(unitName="wallapoptiw")
    EntityManager em;
    @Resource
    UserTransaction ut;  
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarProductos() {
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
		String accion = request.getParameter(ACCION);
		
		if(accion != null) {
			try {
				if (accion.equalsIgnoreCase(EDITAR)) {
					this.editarGet(request, response);
				}else if (accion.equalsIgnoreCase(BORRAR)) {
					this.borrar(request, response);
				} else {
					this.listar(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else {
			this.listar(request, response);	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productoDominio producto = this.getProducto(request);
		if(this.validProducto(producto)) {
			try {
				daoProducto.actualizarProducto(producto);
			} catch (SecurityException | IllegalStateException | SQLException | RollbackException
					| HeuristicMixedException | HeuristicRollbackException | SystemException
					| NotSupportedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	    this.listar(request, response);
	}
	
	private void listar(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {

		Collection<productoDominio> list = new ArrayList<productoDominio>();
		try {
			list = daoProducto.listarProductos();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("listaProductos", list);
		RequestDispatcher rd = request.getRequestDispatcher("gestionProductos.jsp");
		rd.forward(request, response);
	}
	
	private void borrar(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {

		String idTexto = request.getParameter("id");
		if(idTexto != null) {
			productoDominio productoBorrar;// = new clienteDominio();
			//clienteBorrar.setId(Long.parseLong(idTexto));
			
			try {
				productoBorrar = daoProducto.recuperarUnProductoPorClave(Long.parseLong(idTexto));
				daoProducto.borrarProducto(productoBorrar);
			} catch (SQLException | SecurityException | IllegalStateException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SystemException | NotSupportedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	    this.listar(request, response);
	}
	
	private void editarGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		productoDominio productoEditar = new productoDominio();
		String idTexto = request.getParameter("id");
		if(idTexto != null) {
			try {
				productoEditar = daoProducto.recuperarUnProductoPorClave(Long.parseLong(idTexto));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("producto", productoEditar);
		RequestDispatcher rd = request.getRequestDispatcher("editarProductos.jsp");
		rd.forward(request, response);
	}
	
	private boolean validProducto(productoDominio producto) {
		return true;
	}
	
	private productoDominio getProducto(HttpServletRequest request) {
		productoDominio producto = new productoDominio();
		producto.setId(Long.parseLong(request.getParameter("id")));
		producto.setTitulo(request.getParameter("titulo"));
		
		producto.setCategoria(request.getParameter("categoria"));
		producto.setDescripcion(request.getParameter("descripcion"));
		producto.setPrecio(request.getParameter("precio"));
		producto.setEstado(request.getParameter("estado"));
		
		clienteDominio cliente = new clienteDominio();
		cliente.setId(Long.parseLong(request.getParameter("clienteid")));
		producto.setDuenoProducto(cliente);
		
		return producto;
	}

}

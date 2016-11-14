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
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import Cliente.DAOS.clienteDAO;
import Cliente.DAOS.clienteDAOImp;
import Cliente.DAOS.productoDAO;
import Cliente.DAOS.productoDAOImp;
import Cliente.Dominios.clienteDominio;
import Cliente.Dominios.productoDominio;

/**
 * Servlet implementation class modificarPerfil
 */
@WebServlet("/miUsuario")
public class modificarPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ACCION = "accion",
			EDITAR ="editar", BORRAR ="borrar";
	private clienteDAO dao;
	private productoDAO daoProducto;
	private Connection con;
    @PersistenceContext(unitName="wallapoptiw")
    EntityManager em;
    @Resource
    UserTransaction ut;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarPerfil() {
        super();
        // TODO Auto-generated constructor stub
    }


	public void init(ServletConfig config) throws ServletException {
		//this.config = config;
		
		dao = new clienteDAOImp();
		dao.setConexion(em);
		dao.setTransaction(ut);
				
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
					RequestDispatcher rd = request.getRequestDispatcher("miPerfil.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("miPerfil.jsp");
			rd.forward(request, response);	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		clienteDominio usuario = this.getUsuario(request);
		if(validUsuario(usuario)) {
			try {
				dao.actualizarCliente(usuario);
			} catch (SecurityException | IllegalStateException | SQLException | RollbackException
					| HeuristicMixedException | HeuristicRollbackException | SystemException
					| NotSupportedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher("miPerfil.jsp");
		rd.forward(request, response);
	    
	}
	
	
	
	private void borrar(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {

		clienteDominio clienteSesion = (clienteDominio) request.getSession().getAttribute("usuario");
		Long idClienteSesion = clienteSesion.getId() ;
		
		if(idClienteSesion != 0L) {
			clienteDominio clienteBorrar;// = new clienteDominio();
			//clienteBorrar.setId(Long.parseLong(idTexto));
			
			try {
				clienteBorrar = dao.recuperarUnClientePorClave(idClienteSesion);
				for(productoDominio pro : clienteBorrar.getProductos()){
					daoProducto.borrarProducto(pro);
				}
				dao.borrarCliente(clienteBorrar);
			} catch (SQLException | SecurityException | IllegalStateException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SystemException | NotSupportedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher("miPerfil.jsp");
		rd.forward(request, response);
	}
	
	private void editarGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		
		clienteDominio clienteEditar = new clienteDominio();
		clienteDominio clienteSesion = (clienteDominio) request.getSession().getAttribute("usuario");
		Long idClienteSesion = clienteSesion.getId() ;
		
		if(idClienteSesion != 0L) {
			try {
				clienteEditar = dao.recuperarUnClientePorClave(idClienteSesion);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("usuario", clienteEditar);
		RequestDispatcher rd = request.getRequestDispatcher("editarUsuarios.jsp");
		rd.forward(request, response);
	}

	private boolean validUsuario(clienteDominio usuario) {
		return true;
	}
	private clienteDominio getUsuario(HttpServletRequest request) {
		clienteDominio usuario = new clienteDominio();
		usuario.setId(Long.parseLong(request.getParameter("id")));
		usuario.setCorreo(request.getParameter("email"));
		
		usuario.setNombre(request.getParameter("nomusu"));
		usuario.setApellidos(request.getParameter("apellidos"));
		usuario.setContrasena(request.getParameter("contra1"));
		usuario.setProvincia(request.getParameter("prov"));
		
		return usuario;
	}

}

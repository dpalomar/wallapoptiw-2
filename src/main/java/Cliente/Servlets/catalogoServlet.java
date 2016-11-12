package Cliente.Servlets;

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
import javax.transaction.UserTransaction;

import Cliente.DAOS.productoDAO;
import Cliente.DAOS.productoDAOImp;
import Cliente.Dominios.productoDominio;

/**
 * Servlet implementation class catalogoServlet
 */
@WebServlet("/catalogo")
public class catalogoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private productoDAO daoProducto;
	private Connection con;
    @PersistenceContext(unitName="wallapoptiw")
    EntityManager em;
    @Resource
    UserTransaction ut;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public catalogoServlet() {
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
		
		Collection<productoDominio> list = new ArrayList<productoDominio>();
		try {
			list = daoProducto.listarProductos();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(request.getParameter("avanzada") != null){
			request.setAttribute("avanzada", "ture");
		}
		this.mostrarResultados(request, response, list);
	}

	/**'
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String texto = request.getParameter("texto");
		Collection<productoDominio> list = null;

		try {
			if(texto != null) {
				list = this.buscarTexto(texto);
			} else {
				String categoria = request.getParameter("categoria");
				String provincia = request.getParameter("provincia");
				String vendedor = request.getParameter("vendedor");
				String titulo = request.getParameter("titulo");
				String descripcion = request.getParameter("descripcion");
				if("vacio".equals(categoria)){
					categoria = null;
				}
				
				list = this.busquedaAvanzada(categoria, provincia, vendedor, titulo, descripcion);
				
				request.setAttribute("avanzada", "true");
				request.setAttribute("categoria", categoria);
				request.setAttribute("provincia", provincia);
				request.setAttribute("vendedor", vendedor);
				request.setAttribute("titulo", titulo);
				request.setAttribute("descripcion", descripcion);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.mostrarResultados(request, response, list);
	}

	private Collection<productoDominio> buscarTexto(String texto) throws SQLException{
		return daoProducto.recuperarProductosPorTexto(texto);
	}

	private Collection<productoDominio> busquedaAvanzada(String categoria, String provincia, String vendedor, String titulo, String descripcion) throws SQLException{
		return daoProducto.recuperarProductosAvanzado(categoria, provincia, vendedor, titulo, descripcion);
	}
	private void mostrarResultados(HttpServletRequest request, HttpServletResponse response, Collection<productoDominio> list) throws ServletException, IOException {
		request.setAttribute("listaProductos", list);
		RequestDispatcher rd = request.getRequestDispatcher("catalogo.jsp");
		rd.forward(request, response);
	}
}

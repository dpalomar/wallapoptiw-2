package Admin.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
import Cliente.Dominios.clienteDominio;

/**
 * Servlet implementation class modificarUsuarios
 */
@WebServlet("/gestionUsuarios")
public class modificarUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private clienteDAO dao;
	private Connection con;
    @PersistenceContext(unitName="wallapoptiw")
    EntityManager em;
    @Resource
    UserTransaction ut;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarUsuarios() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {
		//this.config = config;
		
		dao = new clienteDAOImp();
		dao.setConexion(em);
		dao.setTransaction(ut);
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
		
		RequestDispatcher rd = request.getRequestDispatcher("gestionUusuarios.jsp");
		rd.forward(request, response);
		
	  }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();  
		response.setContentType("text/html");  
		out.println("<script type=\"text/javascript\">");  
		out.println("alert('LLAMANDO AL SERVLET');");  
		out.println("</script>");
		
		String correoC = request.getParameter("CorreoClien");
		clienteDominio clienteBorrar;
		
		try {
			clienteBorrar = dao.recuperarUnClientePorCorreo(correoC);
			dao.borrarCliente(clienteBorrar);
		} catch (SQLException | SecurityException | IllegalStateException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SystemException | NotSupportedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
	    
	    RequestDispatcher rd = request.getRequestDispatcher("gestionUsuarios.jsp");
		rd.forward(request, response);
	    
	}

}

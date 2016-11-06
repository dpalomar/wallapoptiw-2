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
import javax.transaction.UserTransaction;

import Cliente.DAOS.clienteDAO;
import Cliente.DAOS.clienteDAOImp;
import Cliente.Dominios.clienteDominio;

/*import Cliente.DAOS.productoDAO;
import Cliente.DAOS.productoDAOImp;
import Cliente.Dominios.productoDominio;*/


/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
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
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    public void init(ServletConfig config) throws ServletException {
    	 //this.config = config;
    	 		
    	 dao = new clienteDAOImp();
    	 dao.setConexion(em);
    	 dao.setTransaction(ut);
    	 	
    	
    	 		
    	 
    	 clienteDominio u1 = new clienteDominio();
    	 clienteDominio u2 = new clienteDominio();
    	 clienteDominio u3 = new clienteDominio();
    	 clienteDominio u4 = new clienteDominio();
    	 
    	 	
    	 u1.setNombre("Manuel");
    	 u1.setApellidos("Estada");
    	 u1.setCorreo("100291136@gmail.com");
    	 u1.setContrasena("1234");
    	 u1.setProvincia("1");
    	 
    	 u2.setNombre("Carolina");
    	 u2.setApellidos("Arredondo");
    	 u2.setCorreo("carolina@hotmail.com");
    	 u2.setContrasena("1234");
    	 u2.setProvincia("7");
    	 		
    	 u3.setNombre("David");
    	 u3.setApellidos("Palomar");
    	 u3.setCorreo("dpalomar@msn.es");
    	 u3.setContrasena("1234");
    	 u3.setProvincia("23");
    	 		
    	 u4.setNombre("Maria");
    	 u4.setApellidos("Martinez");
    	 u4.setCorreo("mmartinez@hotmail.es");
    	 u4.setContrasena("1234");
    	 u4.setProvincia("32");
    	 	
    	 try {
    	 	ut.begin();
    	 	
    	 	em.persist(u1);
    	 	em.persist(u2);
    	 	em.persist(u3);
    	 	em.persist(u4);
    	 	
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
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String correo = request.getParameter("exampleInputEmail1");
		String contrasena = request.getParameter("exampleInputPassword1");
		
	
		if(validarLogin(correo, contrasena) == true)
		{			
			RequestDispatcher rd = request.getRequestDispatcher("inicioCliente.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("loginCorrecto", "false");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

	private boolean validarLogin(String correo, String contrasena) 
	{
		boolean res = true;
		
		return res;
	}

}

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

/**
 * Servlet implementation class registroServlet
 */
@WebServlet("/registroServlet")
public class registroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config;
	private clienteDAO dao;
	private Connection con;
	private static final String ALTA="ALTA",EDITAR="EDITAR",BORRAR="BORRAR";
    @PersistenceContext(unitName="wallapoptiw")
    EntityManager em;
    @Resource
    UserTransaction ut;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
		this.config = config;
		
		dao = new clienteDAOImp();
		dao.setConexion(em);
		dao.setTransaction(ut);
		
		

		clienteDominio u1 = new clienteDominio();
		clienteDominio u2 = new clienteDominio();
		clienteDominio u3 = new clienteDominio();
		clienteDominio u4 = new clienteDominio();
		
		u1.setNombre("Usu1");
		u1.setApellidos("Ape1");
		u1.setCorreo("cor1@cor.es");
		u1.setContrasena("1234");
		u1.setProvincia("1");
		
		u2.setNombre("Usu2");
		u2.setApellidos("Ape2");
		u2.setCorreo("cor2@cor.es");
		u2.setContrasena("1234");
		u2.setProvincia("1");
		
		u3.setNombre("Usu3");
		u3.setApellidos("Ape3");
		u3.setCorreo("cor3@cor.es");
		u3.setContrasena("1234");
		u3.setProvincia("1");
		
		u4.setNombre("Usu4");
		u4.setApellidos("Ape4");
		u4.setCorreo("cor4@cor.es");
		u4.setContrasena("1234");
		u4.setProvincia("1");
		
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
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("registro.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String contras = request.getParameter("contra1");
		String nombre = request.getParameter("nomusu");
		String apellido = request.getParameter("apellidos");
		String ciudad = request.getParameter("prov");
	
		if(validarRegistro(email, contras, nombre, apellido, ciudad) == true)
		{	
		//validar que el usuario no exixte, lo comprobamos mirando que el correo que introduce no está en la base de datos.
			
			try {
				if(dao.recuperarUnClientePorCorreo(email)!=null){
					request.setAttribute("usuarioExistente", "true");
					RequestDispatcher rd = request.getRequestDispatcher("registro.jsp");
					rd.forward(request, response);
				} else {
					clienteDominio nuevoCliente= new clienteDominio();

					nuevoCliente.setCorreo(email);
					nuevoCliente.setContrasena(contras);
					nuevoCliente.setNombre(nombre);
					nuevoCliente.setApellidos(apellido);
					nuevoCliente.setProvincia(ciudad);
					
					dao.crearCliente(nuevoCliente);
					
					request.setAttribute("registroCorrecto", "true");
					RequestDispatcher rd = request.getRequestDispatcher("registro.jsp");
					rd.forward(request, response);
				}
			}
			catch (Exception ex){
				response.getWriter().append("<html><head><title>Wallapop</title></head><body><p>").append(ex.getMessage()).append("</p></body></html>");
			}
		}
		else
		{
			response.sendRedirect("registro.jsp");
		}
	}

	private boolean validarRegistro(String correo, String contras, String nombre, String apellido, String ciudad) 
	{
		boolean res = true;
		
		return res;
	}
		
	

}

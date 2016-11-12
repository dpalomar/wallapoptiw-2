package Cliente.Servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
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
import Cliente.DAOS.productoDAO;
import Cliente.DAOS.productoDAOImp;
import Cliente.Dominios.clienteDominio;
import Cliente.Dominios.productoDominio;

/*import Cliente.DAOS.productoDAO;
import Cliente.DAOS.productoDAOImp;
import Cliente.Dominios.productoDominio;*/


/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private productoDAO daoProducto;
	private clienteDAO dao;
	private clienteDominio cliente;
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
    	 		
   		daoProducto = new productoDAOImp();
   		daoProducto.setConexion(em);
   		daoProducto.setTransaction(ut);

   		dao = new clienteDAOImp();
   		dao.setConexion(em);
   		dao.setTransaction(ut);
    	 	 
 	   	 clienteDominio u1 = new clienteDominio();
 	   	 clienteDominio u2 = new clienteDominio();
 	   	 clienteDominio u3 = new clienteDominio();
 	   	 clienteDominio u4 = new clienteDominio();
 	   	 
 	   	 u1.setId(100);
 	   	 u1.setNombre("Manuel");
 	   	 u1.setApellidos("Estada");
 	   	 u1.setCorreo("100291136@gmail.com");
 	   	 u1.setContrasena("1234");
 	   	 u1.setProvincia("1");
 	   	 u1.setEsAdmin(true);

 	   	 u2.setId(101);
 	   	 u2.setNombre("Carolina");
 	   	 u2.setApellidos("Arredondo");
 	   	 u2.setCorreo("carolina@hotmail.com");
 	   	 u2.setContrasena("1234");
 	   	 u2.setProvincia("7");
 	   	 u2.setEsAdmin(true);

 	   	 u3.setId(102);
 	   	 u3.setNombre("David");
 	   	 u3.setApellidos("Palomar");
 	   	 u3.setCorreo("dpalomar@msn.es");
 	   	 u3.setContrasena("1234");
 	   	 u3.setProvincia("23");
 	   	 u3.setEsAdmin(false);
 	   	 	
 	   	 u4.setId(103);
 	   	 u4.setNombre("Maria");
 	   	 u4.setApellidos("Martinez");
 	   	 u4.setCorreo("mmartinez@hotmail.es");
 	   	 u4.setContrasena("1234");
 	   	 u4.setProvincia("32");
 	   	 u4.setEsAdmin(false);
    	 	
 	   	 	productoDominio p1 = new productoDominio();
 	   	 	productoDominio p2 = new productoDominio();
    	 	productoDominio p3 = new productoDominio();
    	 	productoDominio p4 = new productoDominio();
    	 	productoDominio p5 = new productoDominio();
    	 	productoDominio p6 = new productoDominio();
    	 
    	 	p1.setTitulo("Cajonera Blanca IKEA");
    	 	p1.setCategoria("Mobiliario");
    	 	p1.setDescripcion("Mueble blanco de IKEA con cinco cajones");
    	 	p1.setPrecio("45");
    	 	p1.setEstado("Vendido");
    	 	p1.setDuenoProducto(u1);
    	 	/*try {
				File imagen1 = new File("/home/tiw/wallapoptiw/src/main/webapp/images/cajones.jpg");
				InputStream im1 = new FileInputStream(imagen1);
				byte [] buffer = new byte [(int) imagen1.length()];
				int readers = im1.read(buffer);
				p1.setImagen(buffer);
    	 	} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
    	 	
    	 	
    	 
    	 	p2.setTitulo("Bicicleta de carretera");
    	 	p2.setCategoria("Vehiculos");
    	 	p2.setDescripcion("Bicicleta de carretera Elektra Race");
    	 	p2.setPrecio("340");
    	 	p2.setEstado("Disponible");
    	 	p2.setDuenoProducto(u2);
    	 
    	 	p3.setTitulo("Sofa de esquina");
    	 	p3.setCategoria("Mobiliario");
    	 	p3.setDescripcion("Sofa blanco de esquina con almacenaje");
    	 	p3.setPrecio("190");
    	 	p3.setEstado("Disponible");
    	 	p3.setDuenoProducto(u3);
    	 	
    	 	p4.setTitulo("Iphone 4s");
    	 	p4.setCategoria("Electrónica");
    	 	p4.setDescripcion("Iphone 4s con cargador y auriculares incluidos");
    	 	p4.setPrecio("120");
    	 	p4.setEstado("Disponible");
    	 	p4.setDuenoProducto(u1);
    	 	
    	 	p5.setTitulo("Bolso Miau");
    	 	p5.setCategoria("Moda y belleza");
    	 	p5.setDescripcion("Bolso de piel de serpiente valorado en 750 euros");
    	 	p5.setPrecio("180");
    	 	p5.setEstado("Vendido");
    	 	p5.setDuenoProducto(u2);
    	 	
    	 	p6.setTitulo("Cachimba");
    	 	p6.setCategoria("Otros");
    	 	p6.setDescripcion("Cachimba de 50cm traida de Marruecos");
    	 	p6.setPrecio("65");
    	 	p6.setEstado("Disponible");
    	 	p6.setDuenoProducto(u3);
	    	 	
	    	 try {
	    		 
		  	 	ut.begin();
		
		  	 	
		 	 	em.persist(u1);
		 	 	em.persist(u2);
		 	 	em.persist(u3);
		 	 	em.persist(u4);
		 	 
		 	 	
		  	 	em.persist(p1);
		  	 	em.persist(p2);
		  	 	em.persist(p3);
		  	 	em.persist(p4);
		  	 	em.persist(p5);
		  	 	em.persist(p6);
		
		  	 	
		 		em.flush();
		 		
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
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String correo = request.getParameter("exampleInputEmail1");
		String contrasena = request.getParameter("exampleInputPassword1");
		clienteDominio usuario;
	
		try {
			if(validarLogin(correo, contrasena)){
				usuario = dao.recuperarUnClientePorCorreo(correo);
				
				String pagina = usuario.isAdmin() ? "inicioAdmin.jsp" : "inicioCliente.jsp";
				
				
				request.getSession().setAttribute("usuario", usuario);
				
				response.sendRedirect(pagina);
			}
			else
			{
				request.setAttribute("loginCorrecto", "false");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private boolean validarLogin(String correo, String contrasena) throws SQLException 
	{
		boolean res = false;
		cliente = dao.recuperarUnClientePorCorreo(correo);
		if(cliente != null && contrasena.equals(cliente.getContrasena())){
			res = true;
		}
		
		
		return res;
	}

}

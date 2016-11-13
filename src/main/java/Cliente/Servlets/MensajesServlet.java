package Cliente.Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

import Cliente.DAOS.MensajesDAO;
import Cliente.DAOS.MensajesDAOImpl;
import Cliente.DAOS.clienteDAO;
import Cliente.DAOS.clienteDAOImp;
import Cliente.Dominios.Mensaje;
import Cliente.Dominios.clienteDominio;
import Cliente.util.EscribeEnCola;

/**
 * Servlet implementation class MensajesServlet
 */

@WebServlet("/mensajes")
public class MensajesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@PersistenceContext(unitName="wallapoptiw")
	private EntityManager em;
	@Resource
	private UserTransaction ut;
	private clienteDAO dao;
	private MensajesDAO msgDao;

	@Inject
	private EscribeEnCola colaMensajes;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MensajesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		dao = new clienteDAOImp();
		dao.setConexion(em);
   	 	dao.setTransaction(ut);
   	 	msgDao = new MensajesDAOImpl(em, ut);
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		clienteDominio u = (clienteDominio) sesion.getAttribute("usuario");
		List<Mensaje> mensajes = msgDao.findAllMessagesByUsuario(u);
		request.setAttribute("usuario", u);
		request.setAttribute("listaMensajes", mensajes);
		RequestDispatcher rd = request.getRequestDispatcher("chat.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Mensaje msgDao = null;
		try {
			String mensaje = request.getParameter("mensaje");
			clienteDominio from = (clienteDominio) request.getSession().getAttribute("usuario");
			clienteDominio to = dao.recuperarUnClientePorCorreo(request.getParameter("to"));
			
			msgDao = new Mensaje(mensaje,from, to);
			
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		colaMensajes.enviar(msgDao);
		
		RequestDispatcher rd = request.getRequestDispatcher("chat.jsp");
		rd.forward(request, response);
	}

}

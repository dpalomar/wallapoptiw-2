package Cliente.Servlets;

import java.io.IOException;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

import Cliente.DAOS.MensajesDAO;
import Cliente.DAOS.MensajesDAOImpl;
import Cliente.DAOS.clienteDAO;
import Cliente.DAOS.clienteDAOImp;
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

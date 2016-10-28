package Cliente.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registroServlet
 */
@WebServlet("/registroServlet")
public class registroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registroServlet() {
        super();
        // TODO Auto-generated constructor stub
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
			request.setAttribute("registroCorrecto", "true");
			RequestDispatcher rd = request.getRequestDispatcher("registro.jsp");
			rd.forward(request, response);
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

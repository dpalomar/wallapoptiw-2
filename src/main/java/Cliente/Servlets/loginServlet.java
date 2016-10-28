package Cliente.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
			//request.getSession().setAttribute("loginCorrecto", "false");
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

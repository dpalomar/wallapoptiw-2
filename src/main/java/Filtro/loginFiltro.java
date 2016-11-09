package Filtro;

import java.io.IOException;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

import Cliente.DAOS.clienteDAO;
import Cliente.DAOS.clienteDAOImp;
import Cliente.DAOS.productoDAO;
import Cliente.DAOS.productoDAOImp;
import Cliente.Dominios.clienteDominio;
import Cliente.Dominios.productoDominio;

/**
 * Servlet Filter implementation class loginFiltro
 */
@WebFilter("/*")
public class loginFiltro implements Filter {

	@PersistenceContext(unitName="wallapoptiw")
	EntityManager em;
	@Resource
	UserTransaction ut;

	private productoDAO daoProducto;
	private clienteDAO dao;
    /**
     * Default constructor. 
     */
    public loginFiltro() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		this.init(null);
		HttpServletRequest httpRequest = ((HttpServletRequest)request);
		HttpSession sesion = httpRequest.getSession();
		String loginUrl = httpRequest.getContextPath() + "/login";
		String path = httpRequest.getServletPath();
		clienteDominio usuario = (clienteDominio)sesion.getAttribute("usuario");
		String url = ((HttpServletRequest)request).getRequestURL().toString();
		
		if(path.equals("/login") ||
				path.equals("/registro") || 
				path.startsWith("/css") ||
				path.startsWith("/fonts") ||
				path.startsWith("/images") ||
				path.startsWith("/js")){
			chain.doFilter(request, response);
		} else if (usuario==null) { 
			((HttpServletResponse) response).sendRedirect(loginUrl);
		}else{
			if(url.contains("admin")){
				if(usuario.isAdmin()){
					chain.doFilter(request, response);
				} else {
					sesion.setAttribute("usuario", null);
					((HttpServletResponse) response).sendRedirect(loginUrl);
				}
			} else {
				chain.doFilter(request, response);
			}
		//} else if (url.contains("css"))  {
		//}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}

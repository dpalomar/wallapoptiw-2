package Cliente.DAOS;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import Cliente.Dominios.productoDominio;

public class productoDAOImp implements productoDAO{
	
	private EntityManager em;
	private UserTransaction ut;

	@Override
	public productoDominio actualizarProducto(productoDominio producto)
			throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException,
			HeuristicRollbackException, SystemException, NotSupportedException {
		ut.begin();
		em.merge(producto);
		ut.commit();
		return recuperarUnProductoPorClave(producto.getId());
	}

	@Override
	public void borrarProducto(productoDominio producto)
			throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException,
			HeuristicRollbackException, SystemException, NotSupportedException {
		ut.begin();
		em.remove(em.merge(producto));
		em.flush();
		ut.commit();
	}

	@Override
	public productoDominio crearProducto(productoDominio nuevoProducto)
			throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException,
			HeuristicRollbackException, SystemException, NotSupportedException {
		
		ut.begin();
		em.persist(nuevoProducto);
		em.flush();
		ut.commit();
		return nuevoProducto;

	}

	@Override
	public Collection<productoDominio> recuperarProductosPorTexto(String texto) throws SQLException {

		Collection<productoDominio> res = new ArrayList<productoDominio>();
		if(texto != null) {
			Query consulta = em.createQuery("select p from productoDominio p where UPPER(p.titulo) LIKE '%text%' or UPPER(p.descripcion) LIKE '%text%'", productoDominio.class);
			consulta.setParameter("text", texto.toUpperCase());
			for(Object o : consulta.getResultList()) {
				res.add((productoDominio) o);
			}
		}
		return res;	
	}

	@Override
	public productoDominio recuperarUnProductoPorClave(long pk) throws SQLException {
		return em.find(productoDominio.class, pk);
	}

	@Override
	public Collection<productoDominio> listarProductos() throws SQLException {
		return em.createQuery("select p from productoDominio p", productoDominio.class).getResultList();
	}

	@Override
	public void setConexion(EntityManager em) {
		this.em = em;
	}

	@Override
	public void setTransaction(UserTransaction ut) {
		this.ut = ut;
	}

}

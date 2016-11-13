package Cliente.DAOS;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.Query;
//import javax.persistence.Query;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import Cliente.Dominios.clienteDominio;
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
		String titulo, descripcion;
		texto = texto.toUpperCase();
		//texto.toUpperCase();
		Collection<productoDominio> res = new ArrayList<productoDominio>();
		Collection<productoDominio> todos = this.listarProductos();
		if(texto != null) {
			for(productoDominio produc : todos) {
				titulo = produc.getTitulo().toUpperCase();
				descripcion = produc.getDescripcion().toUpperCase();
				if (titulo.contains(texto) || descripcion.contains(texto)){
					res.add(produc);
				}
			}
			//Query consulta = em.createQuery("select p from productoDominio p where UPPER(p.titulo) LIKE '%'||:textoo||'%' or UPPER(p.descripcion) LIKE '%'||:texttt||'%' ", productoDominio.class);
			//consulta.setParameter("textoo", texto);
			//consulta.setParameter("texttt", texto);
			//for(Object o : consulta.getResultList()) {
			//	res.add((productoDominio) o);
			//}
		}
		return res;	
	}

	@Override
	public Collection<productoDominio> recuperarProductosAvanzado(String categoria, String provincia, String vendedor, String titulo, String descripcion) throws SQLException {
		categoria = categoria == null ? null : categoria.toUpperCase();
		provincia = provincia == null ? null : provincia.toUpperCase();
		vendedor = vendedor == null ? null : vendedor.toUpperCase();
		titulo = titulo == null ? null : titulo.toUpperCase();
		descripcion = descripcion == null ? null : descripcion.toUpperCase();
		//texto.toUpperCase();
		Collection<productoDominio> res = new ArrayList<productoDominio>();
		Collection<productoDominio> todos = this.listarProductos();
		for(productoDominio produc : todos) {
			//producto_titulo = produc.getTitulo() == null ? null : produc.getTitulo().toUpperCase();
			//descripcion = produc.getDescripcion().toUpperCase();
			Object dueno = produc.getDuenoProducto();
			if ((categoria == null || categoria == "" || (produc.getCategoria() != null && 
							produc.getCategoria().toUpperCase().contains(categoria))) &&
				(titulo == null || titulo == "" || (produc.getTitulo() != null && 
							produc.getTitulo().toUpperCase().contains(titulo))) &&
				(descripcion == null || descripcion == "" || (produc.getDescripcion() != null && 
							produc.getDescripcion().toUpperCase().contains(descripcion))) &&
				(provincia == null || provincia == "" || (produc.getDuenoProducto() != null &&  
							produc.getDuenoProducto().getProvincia().toUpperCase().contains(provincia))) &&
				(vendedor == null || vendedor == "" || (produc.getDuenoProducto() != null && 
									(produc.getDuenoProducto().getNombre().toUpperCase().contains(vendedor) ||
									 produc.getDuenoProducto().getApellidos().toUpperCase().contains(vendedor))))){
				res.add(produc);
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
	public Collection<productoDominio> recuperarProductosPorDueno(clienteDominio cliente) throws SQLException {
		Query query = em.createQuery("select p from productoDominio p where p.duenoProducto=:dueno", productoDominio.class);
		return query.setParameter("dueno", cliente).getResultList();
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

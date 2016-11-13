package Cliente.DAOS;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Query;
import javax.persistence.EntityManager;

import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import Cliente.Dominios.clienteDominio;
import Cliente.Dominios.productoDominio;


public class clienteDAOImp implements clienteDAO {
	private EntityManager em;
	private UserTransaction ut;
	private productoDAO daoProductos;
	
	public clienteDAOImp() {
		daoProductos = new productoDAOImp();
		daoProductos.setConexion(em);
		daoProductos.setTransaction(ut);
	}
	@Override
	public Collection<clienteDominio> listarClientes() throws SQLException{
		return em.createQuery("select c from clienteDominio c", clienteDominio.class).getResultList();
	}
	@Override
	public clienteDominio recuperarUnClientePorClave(long pk) throws SQLException{
		clienteDominio res = em.find(clienteDominio.class, pk);
		Set<productoDominio> resPro = new HashSet<productoDominio>();
		for(productoDominio pro : daoProductos.recuperarProductosPorDueno(res)){
			resPro.add(pro);
		}
		res.setProductos(resPro);
		return res;
	}
	@SuppressWarnings("rawtypes")
	@Override
	/**
	 * Se asume que el campo nombre es unique y por tanto solo recuperará un usuario en caso de existir
	 */
	public clienteDominio recuperarUnClientePorCorreo(String correo) throws SQLException{

		clienteDominio res = null;
		Query consulta = em.createQuery("select c from clienteDominio c where c.correo=:corr", clienteDominio.class);
		consulta.setParameter("corr", correo);
		List list = consulta.getResultList();
		if(list != null && list.size() > 0) {
			res = (clienteDominio) list.get(0); 
		}
		return res;
	}
	@Override
	public clienteDominio crearCliente(clienteDominio nuevoCliente) throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException{
		ut.begin();
		em.persist(nuevoCliente);
		em.flush();
		ut.commit();
		return recuperarUnClientePorCorreo(nuevoCliente.getCorreo());
	}
	@Override
	public void borrarCliente(clienteDominio cliente) throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException {
		ut.begin();
		em.remove(em.merge(cliente));
		em.flush();
		ut.commit();
	}
	@Override
	public clienteDominio actualizarCliente(clienteDominio cliente) throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException {
		ut.begin();
		em.merge(cliente);
		ut.commit();
		return recuperarUnClientePorClave(cliente.getId());
	}
	@Override
	public void setConexion(EntityManager em) {
		this.em = em;
		
	}
	@Override
	public void setTransaction(UserTransaction ut){
		this.ut = ut;
	}
	

}

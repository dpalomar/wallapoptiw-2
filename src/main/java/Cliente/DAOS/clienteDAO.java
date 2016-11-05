package Cliente.DAOS;


import java.sql.SQLException;
import java.util.Collection;

import Cliente.Dominios.clienteDominio;

import javax.persistence.EntityManager;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

public interface clienteDAO {

	public abstract clienteDominio actualizarCliente(clienteDominio cliente) throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException;

	public abstract void borrarCliente(clienteDominio cliente) throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException;

	public abstract clienteDominio crearCliente(clienteDominio nuevoCliente) throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException;

	public abstract clienteDominio recuperarUnClientePorCorreo(String correo) throws SQLException;

	public abstract clienteDominio recuperarUnClientePorClave(long pk) throws SQLException;

	public abstract Collection<clienteDominio> listarClientes() throws SQLException;

	public abstract void setConexion(EntityManager em);

	public abstract void setTransaction(UserTransaction ut);
}
	


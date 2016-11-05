package Cliente.DAOS;

import java.sql.SQLException;
import java.util.Collection;

import javax.persistence.EntityManager;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import Cliente.Dominios.productoDominio;

public interface productoDAO {

	public abstract productoDominio actualizarProducto(productoDominio producto) throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException;

	public abstract void borrarProducto(productoDominio producto) throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException;

	public abstract productoDominio crearProducto(productoDominio nuevoProducto) throws SQLException, SecurityException, IllegalStateException, RollbackException, HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException;

	public abstract Collection<productoDominio> recuperarProductosPorTexto(String texto) throws SQLException;

	public abstract productoDominio recuperarUnProductoPorClave(long pk) throws SQLException;

	public abstract Collection<productoDominio> listarProductos() throws SQLException;

	public abstract void setConexion(EntityManager em);

	public abstract void setTransaction(UserTransaction ut);
	
	
}

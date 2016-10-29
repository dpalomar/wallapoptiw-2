package Cliente.DAOS;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.ResourceBundle;

import Cliente.Dominios.clienteDominio;


public interface clienteDAO {

	public abstract clienteDominio actualizarUsuario(clienteDominio usuario) throws SQLException;

	public abstract void borrarUsuario(clienteDominio usuario) throws SQLException;

	public abstract clienteDominio crearUsuario(clienteDominio nuevoUsuario) throws SQLException;

	public abstract clienteDominio recuperarUnUsuarioPorNombre(String nombre) throws SQLException;

	public abstract clienteDominio recuperarUnUsuarioPorClave(long pk) throws SQLException;

	public abstract Collection<clienteDominio> listarUsuarios() throws SQLException;

	public abstract void setConexion(Connection con);

	public abstract void setQuerys(ResourceBundle rb);
}
	


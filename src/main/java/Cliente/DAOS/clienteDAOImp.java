package Cliente.DAOS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.ResourceBundle;

import Cliente.Dominios.clienteDominio;


public class clienteDAOImp implements clienteDAO {
	private Connection con;
	private ResourceBundle rb;
	@Override
	public Collection<clienteDominio> listarUsuarios() throws SQLException{
		Statement st = con.createStatement();
		ResultSet resultados = st.executeQuery(rb.getString("seleccionarTodosUsuarios"));
		
		List<clienteDominio> listaUsuarios = new ArrayList<clienteDominio>();
		clienteDominio usuario;
		while (resultados.next()) {
			usuario = new clienteDominio();
			usuario.setId(resultados.getInt("id"));
			usuario.setNombre(resultados.getString("nombre"));
			usuario.setContrasena(resultados.getString("contrasena"));
			listaUsuarios.add(usuario);
		}
		return listaUsuarios;
	}
	@Override
	public clienteDominio recuperarUnUsuarioPorClave(long pk) throws SQLException{
		PreparedStatement ps = con.prepareStatement(rb.getString("seleccionarUsuarioPK"));
		ps.setLong(1, pk);
		clienteDominio usuario = null;
		ResultSet resultados = ps.executeQuery();
		while (resultados.next()) {
			usuario = new clienteDominio();
			usuario.setId(resultados.getInt("id"));
			usuario.setNombre(resultados.getString("nombre"));
			usuario.setContrasena(resultados.getString("contrasena"));
			
		}
		return usuario;
	}
	@Override
	/**
	 * Se asume que el campo nombre es unique y por tanto solo recuperará un usuario en caso de existir
	 */
	public clienteDominio recuperarUnUsuarioPorNombre(String nombre) throws SQLException{
		PreparedStatement ps = con.prepareStatement(rb.getString("seleccionarUsuarioNombre"));
		ps.setString(1, nombre);
		clienteDominio usuario = null;
		ResultSet resultados = ps.executeQuery();
		while (resultados.next()) {
			usuario = new clienteDominio();
			usuario.setId(resultados.getInt("id"));
			usuario.setNombre(resultados.getString("nombre"));
			usuario.setContrasena(resultados.getString("contrasena"));
			
		}
		return usuario;
	}
	@Override
	public clienteDominio crearUsuario(clienteDominio nuevoUsuario) throws SQLException{
		PreparedStatement ps = con.prepareStatement(rb.getString("crearUsuario"));
		ps.setString(1, nuevoUsuario.getNombre());
		ps.setString(2, nuevoUsuario.getContrasena());
		ps.execute();
		
		return recuperarUnUsuarioPorNombre(nuevoUsuario.getNombre());
	}
	@Override
	public void borrarUsuario(clienteDominio usuario) throws SQLException{
		PreparedStatement ps = con.prepareStatement(rb.getString("borrarUsuario"));
		ps.setLong(1, usuario.getId());
		ps.execute();
		
	}
	@Override
	public clienteDominio actualizarUsuario(clienteDominio usuario) throws SQLException{
		PreparedStatement ps = con.prepareStatement(rb.getString("actualizarUsuario"));
		ps.setString(1, usuario.getNombre());
		ps.setString(2, usuario.getContrasena());
		ps.setLong(3, usuario.getId());
		ps.execute();
		return recuperarUnUsuarioPorClave(usuario.getId());
		
	}
	@Override
	public void setConexion(Connection con) {
		this.con = con;
		
	}
	@Override
	public void setQuerys(ResourceBundle rb) {
		this.rb = rb;
		
	}

}

package Cliente.Dominios;

import static javax.persistence.GenerationType.AUTO;

import java.io.Serializable;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: clienteDominio
 *
 */
@Entity
@Table(name="USUARIOS")
public class clienteDominio implements Serializable {

	
	private static final long serialVersionUID = 1L;
	

	@Id
	@GeneratedValue(strategy = AUTO)
	private long id;
	@Column(nullable = false, length = 30)
	private String nombre;
	@Column(nullable = false, length = 30)
	private String apellidos;
	@Column(nullable = false, length = 20)
	private String contrasena;
	@Column(nullable = false, length = 100)
	private String correo;
	@Column(nullable = false, length = 40)
	private String provincia;
	
	public clienteDominio() {
		super();
	}
	
	public clienteDominio(String nombre, String apellidos, String contrasena, String correo, String provincia) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.contrasena = contrasena;
		this.correo = correo;
		this.provincia = provincia;
	}


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

}

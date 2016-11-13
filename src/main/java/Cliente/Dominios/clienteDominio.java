package Cliente.Dominios;

import static javax.persistence.GenerationType.AUTO;

import java.io.Serializable;
import java.util.Set;

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
	@Column(length = 30, nullable = false)
	private String nombre;
	@Column(nullable = false, length = 30)
	private String apellidos;
	@Column(nullable = false, length = 20)
	private String contrasena;
	@Column(nullable = false, length = 100, unique = true)
	private String correo;
	@Column(nullable = false, length = 40)
	private String provincia;
	@Column(nullable = false)
	private boolean esAdmin;

    @OneToMany(cascade=CascadeType.ALL, mappedBy="duenoProducto", targetEntity=productoDominio.class)
    private Set<productoDominio> productos; 
    
	public clienteDominio() {
		super();
	}
	
	public clienteDominio(String nombre, String apellidos, String contrasena, String correo, String provincia, boolean esAdmin) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.contrasena = contrasena;
		this.correo = correo;
		this.provincia = provincia;
		this.esAdmin = esAdmin;
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

	public boolean isAdmin() {
		return esAdmin;
	}

	public void setEsAdmin(boolean esAdmin) {
		this.esAdmin = esAdmin;
	}

	public Set<productoDominio> getProductos() {
		return productos;
	}
	

	public void setProductos(Set<productoDominio> productos) {
		this.productos = productos;
	}
}

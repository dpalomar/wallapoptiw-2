package Cliente.Dominios;

import static javax.persistence.GenerationType.AUTO;

import java.io.Serializable;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: productoDominio
 *
 */
@Entity
@Table(name="PRODUCTOS")

public class productoDominio implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = AUTO)
	private long id;
	@Column(nullable = false, length = 30)
	private String titulo;
	@Column(nullable = false, length = 30)
	private String categoria;
	@Column(nullable = false, length = 300)
	private String descripcion;
	@Column(nullable = false)
	private int precio;
	@Column(nullable = false ,length = 30)
	private String estado;
	
	public productoDominio() {
		super();
	}

	public productoDominio(String titulo, String categoria, String descripcion, int precio, String estado) {
		super();
		this.titulo = titulo;
		this.categoria = categoria;
		this.descripcion = descripcion;
		this.precio = precio;
		this.estado = estado;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getPrecio() {
		return precio;
	}

	public void setPrecio(int precio) {
		this.precio = precio;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
	
	
}

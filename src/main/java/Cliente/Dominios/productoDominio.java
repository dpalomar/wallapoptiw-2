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
	

	enum TipoCategoria {
		TECNOLOGIA (1, "Tecnología"),
		ROPA_INFANTIL (2, "Ropa infantil");
		
		private final int value;
		private final String descripcion;
		
		TipoCategoria(int value, String descripcion){
			this.value = value;
			this.descripcion = descripcion;
		}

		public String getDescripcion() {
			return this.descripcion;
		}
		
		public static TipoCategoria getCategoria(int categoriaIndex) {
		   for (TipoCategoria c : TipoCategoria.values()) {
		       if (c.value == categoriaIndex) return c;
		   }
		   throw new IllegalArgumentException("Categoría no encontrada.");
		}

		public static TipoCategoria getCategoria(String categoriaNombre) {
		   for (TipoCategoria c : TipoCategoria.values()) {
		       if (c.descripcion.equals(categoriaNombre)) return c;
		   }
		   throw new IllegalArgumentException("Categoría no encontrada.");
		}
	}
	
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
	@Column(nullable = false)
	private boolean estado;

    @ManyToOne
    @JoinColumn(name="clienteId", nullable=false)
	private clienteDominio duenoProducto;
	
	
	public productoDominio() {
		super();
	}

	public productoDominio(String titulo, String categoria, String descripcion, int precio, boolean estado, clienteDominio duenoProducto) {
		super();
		this.titulo = titulo;
		this.categoria = categoria;
		this.descripcion = descripcion;
		this.precio = precio;
		this.estado = estado;
		this.duenoProducto = duenoProducto;
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

	public boolean getEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public clienteDominio getDuenoProducto() {
		return duenoProducto;
	}

	public void setDuenoProducto(clienteDominio duenoProducto) {
		this.duenoProducto = duenoProducto;
	}
	
		
}

package Cliente.Dominios;

import static javax.persistence.GenerationType.AUTO;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * Entity implementation class for Entity: Mensaje
 *
 */

@Entity
@Table(name="MENSAJES")

public class Mensaje implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = AUTO)
    private Long id;
    private String mensaje;
    @OneToOne
    private clienteDominio from;
    @OneToOne
    private clienteDominio to;
    
    public Mensaje() {
		// TODO Auto-generated constructor stub
	}
    
    public Mensaje(String mensaje) {
		this.mensaje = mensaje;
	}
    
    public Mensaje(String mensaje, clienteDominio from, clienteDominio to) {
		super();
		this.mensaje = mensaje;
		this.from = from;
		this.to = to;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public clienteDominio getFrom() {
		return from;
	}

	public void setFrom(clienteDominio from) {
		this.from = from;
	}

	public clienteDominio getTo() {
		return to;
	}

	public void setTo(clienteDominio to) {
		this.to = to;
	}
    
}

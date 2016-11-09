package Cliente.DAOS;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.RollbackException;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import Cliente.Dominios.Mensaje;
import Cliente.Dominios.clienteDominio;

public class MensajesDAOImpl implements MensajesDAO {
	

	private EntityManager em;
	private UserTransaction ut;
	
	public MensajesDAOImpl(EntityManager em, UserTransaction ut) {
		super();
		this.em = em;
		this.ut = ut;
	}
	
	public MensajesDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<Mensaje> findAllMessagesByUsuario(clienteDominio cliente) {
		clienteDominio u = em.find(clienteDominio.class, cliente.getId());
		return em.createQuery("select m from Mensaje m where m.to=:to", Mensaje.class)
				.setParameter("to", cliente)
				.getResultList();
	}

	@Override
	public void createMensaje(Mensaje mensaje) throws SecurityException, IllegalStateException, RollbackException,
			HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException,
			NotSupportedException, javax.transaction.RollbackException {
		ut.begin();
		em.persist(mensaje);
		ut.commit();
	}

}

package Cliente.DAOS;

import java.util.List;

import javax.persistence.RollbackException;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.SystemException;

import Cliente.Dominios.Mensaje;
import Cliente.Dominios.clienteDominio;

public interface MensajesDAO {
	
	//Recupera todos los mensajes para un cliente dado
	List<Mensaje> findAllMessagesByUsuario(clienteDominio cliente);
	
	//Crea el mensaje en la tabla MENSAJES con las referencias a las claves de los clientes
	void createMensaje(Mensaje mensaje) throws SecurityException, IllegalStateException, RollbackException,
			HeuristicMixedException, HeuristicRollbackException, SystemException, NotSupportedException, javax.transaction.NotSupportedException, javax.transaction.RollbackException;
}

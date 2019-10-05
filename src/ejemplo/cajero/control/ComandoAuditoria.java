package ejemplo.cajero.control;

import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

/**
 * Comando usado para listar las cuentas 
 */
public class ComandoAuditoria implements Comando {

	@Override
	public String getNombre() {
		return "Auditoria";
	}

	@Override
	public void ejecutar(Banco contexto, Cuenta cuenta) throws Exception {
		
		System.out.println("Auditorias");
		System.out.println();
		getAudit();
		

	}
	
	private void getAudit() {
		
	}

}

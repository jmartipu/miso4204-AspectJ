package ejemplo.cajero.control;

import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

/**
 * Comando usado para listar las cuentas 
 */
public class ComandoListarTransacciones implements Comando {

	@Override
	public String getNombre() {
		return "Listar Transacciones";
	}

	@Override
	public void ejecutar(Banco contexto, Cuenta cuenta) throws Exception {
		
		System.out.println("Listado de Transacciones");
		System.out.println();
		getLog();
		

	}
	
	private void getLog() {
		
	}

}

package ejemplo.cajero.control;

import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

/**
 * Comando usado para listar las cuentas 
 */
public class ComandoListarCuentas implements Comando {

	@Override
	public String getNombre() {
		return "Listar Cuentas";
	}

	@Override
	public void ejecutar(Banco contexto, Cuenta cuenta) throws Exception {
		
		System.out.println("Listado de Cuentas");
		System.out.println();
	
		
		System.out.println(cuenta.getNumero() + " : $ " + cuenta.getSaldo());
		

	}

}

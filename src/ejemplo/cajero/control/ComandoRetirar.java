package ejemplo.cajero.control;

import java.util.Scanner;

import ejemplo.cajero.modelo.Banco;
import ejemplo.cajero.modelo.Cuenta;

/**
 * Comando usado para retirar dinero
 */
public class ComandoRetirar implements Comando {

	@Override
	public String getNombre() {
		return "Retirar dinero";
	}

	@SuppressWarnings("resource")
	@Override
	public void ejecutar(Banco contexto, Cuenta cuenta) throws Exception {
		
		System.out.println("Retiro de Dinero");
		System.out.println();
		
		// la clase Console no funciona bien en Eclipse
		Scanner console = new Scanner(System.in);			
		
		if (cuenta == null) {
			throw new Exception("No existe cuenta ");
		}
		
		System.out.println("Ingrese el valor a retirar");
		String valor = console.nextLine();
	
		try {
			long valorNumerico = Long.parseLong(valor);
			cuenta.retirar(valorNumerico);
		
		} catch (NumberFormatException e) {
			throw new Exception("Valor a retirar no válido : " + valor);
		}
	}

}

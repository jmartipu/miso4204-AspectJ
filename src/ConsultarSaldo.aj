import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoListarCuentas;
import ejemplo.cajero.control.ComandoListarTransacciones;

public aspect ConsultarSaldo {
	pointcut metodoPintaMenu() : call ( private static List<Comando> *.cargaComandos());
	after() returning(Object object): metodoPintaMenu(){
		List<Comando> listaComandos = (List<Comando>) object;
		listaComandos.add(new ComandoListarCuentas());
	}
}
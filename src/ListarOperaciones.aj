import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoListarTransacciones;
import ejemplo.cajero.modelo.Log;

public aspect ListarOperaciones {
	Log log = new Log();
	
	pointcut metodosDeComandos() : call( void ejemplo.cajero.control..*ejecutar(..));
	pointcut metodosGetLog() : call( void ejemplo.cajero.control..*getLog(..));
	pointcut metodoPintaMenu() : call ( private static List<Comando> *.cargaComandos());

	
	before(): metodosDeComandos () {
		log.log("Ejecutando : " + thisJoinPoint.getTarget().getClass().getCanonicalName());
	}

	after(): metodosGetLog(){
		System.out.println(log.getLog());
	}
	
	after() returning(Object object): metodoPintaMenu(){
		List<Comando> listaComandos = (List<Comando>) object;
		listaComandos.add(new ComandoListarTransacciones());
	}
}
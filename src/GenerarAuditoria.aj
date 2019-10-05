import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoAuditoria;
import ejemplo.cajero.control.ComandoListarTransacciones;
import ejemplo.cajero.modelo.Log;

public aspect GenerarAuditoria {
	Log log = new Log();
	String loginDate = "";
	
	pointcut metodosDeComandos() : call( void ejemplo.cajero.control..*ejecutar(..));
	pointcut metodosDeLogin() : call( boolean *.logIn(..));
	pointcut metodosGetAudit() : call( void ejemplo.cajero.control..*getAudit(..));
	pointcut metodoPintaMenu() : call ( private static List<Comando> *.cargaComandos());
	
	before(): metodosDeComandos () {
		log.log("Ejecutando : " + thisJoinPoint.getTarget().getClass().getCanonicalName());
	}
	
	after() returning(boolean b): metodosDeLogin () {
		if(b) {
			SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
			Date date = new Date(System.currentTimeMillis());
			loginDate = formatter.format(date);
		}
	}
	
	after() returning(Object object): metodoPintaMenu(){
		List<Comando> listaComandos = (List<Comando>) object;
		listaComandos.add(new ComandoAuditoria());
	}
	
	after(): metodosGetAudit(){
		System.out.println("Ultimo Loguin:");
		System.out.println(loginDate);
		System.out.println("Lista Operaciones:");
		System.out.println(log.getLog());
	}
	
}
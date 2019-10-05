package ejemplo.cajero.modelo;

import java.util.ArrayList;
import java.util.List;

public class Log {
	private List<String> log = new ArrayList<String>();

	public void log(String mensaje) {
		log.add(mensaje);
	}
	
	public String getLog() {
		StringBuilder sb = new StringBuilder();
		for (String string : log) {
			sb.append(string);
			sb.append("\n");
		}
		return sb.toString();
	}
}

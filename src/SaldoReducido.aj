import ejemplo.cajero.modelo.Cuenta;

public aspect SaldoReducido {
	pointcut metodosDeComandosRetirar() : call( * *.retirar(..));
	
	before() throws Exception: metodosDeComandosRetirar () {
		Cuenta c = (Cuenta)thisJoinPoint.getTarget();
		if((c.getSaldo() - (long)thisJoinPoint.getArgs()[0]) < 200000) {
			throw new Exception("El saldo mínimo es de 200.000");	
		}
		
	}
	
}
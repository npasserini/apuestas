
/**
 * A la cabeza: El jugador apuesta que su número quedará en la primera posición.
 * El premio es de 70 veces el valor de lo apostado con un máximo del 10 % del total
 * recaudado por el sorteo.
 */
object apuestaALaCabeza {
	//	De cada apuesta nos va a interesar el valor apostado por
	//	el jugador, si es ganadora o no del sorteo, el monto del premio en caso de ser ganadora
	//	y el nombre del apostador.

	var numeroApostado
	var valorApostado
	var nombreApostador
	
	method apostar(cuanto, aQueNumero, quien) {
		numeroApostado = aQueNumero
		valorApostado = cuanto
		nombreApostador = quien
	}
	
	method valorApostado() = valorApostado
	
	method nombreApostador() = nombreApostador
	
	method esGanadora(sorteo) = sorteo.numerosGanadores().first() == numeroApostado
	
	method premio(sorteo) = (valorApostado * 70).min(sorteo.totalRecaudado() * 10 / 100)
}
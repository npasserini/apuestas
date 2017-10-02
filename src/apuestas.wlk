
class Apuesta {
	var numeroApostado
	var valorApostado = 10
	var nombreApostador

	constructor(aQueNumero, quien) {
		numeroApostado = aQueNumero
		nombreApostador = quien
	}
	
	constructor(cuanto, aQueNumero, quien) = self(aQueNumero, quien) {
		valorApostado = cuanto
	}

	method valorApostado() = valorApostado
	
	method nombreApostador() = nombreApostador

	method esGanadora(sorteo) = false
	
	method premio(sorteo)
}


/**
 * A la cabeza: El jugador apuesta que su número quedará en la primera posición.
 * El premio es de 70 veces el valor de lo apostado con un máximo del 10 % del total
 * recaudado por el sorteo.
 */
class ApuestaALaCabeza inherits Apuesta {
	override method esGanadora(sorteo) = sorteo.numerosGanadores().first() == numeroApostado
	
	override method premio(sorteo) = (valorApostado * 70).min(sorteo.totalRecaudado() * 10 / 100)
}

class ApuestaALosPrimerosDos inherits Apuesta {
	method posiblesGanadores(sorteo) = sorteo.numerosGanadores().subList(0, 1)
	override method esGanadora(sorteo) = self.posiblesGanadores(sorteo).contains(numeroApostado) 

	override method premio(sorteo) = (valorApostado * 30).min(sorteo.totalRecaudado() * 5 / 100)
}


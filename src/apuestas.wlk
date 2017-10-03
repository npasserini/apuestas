
class Apuesta inherits Object {
	var numeroApostado
	var valorApostado = self.valorPorDefecto()
	var nombreApostador

	constructor(aQueNumero, quien) {
		numeroApostado = aQueNumero
		nombreApostador = quien
	}
	
	constructor(cuanto, aQueNumero, quien) = self(aQueNumero, quien) {
		valorApostado = cuanto
	}
	
	method valorPorDefecto()
	
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
	override method valorPorDefecto() = 20
	
	override method esGanadora(sorteo) = 
		sorteo.numerosGanadores().first() == numeroApostado
	
	override method premio(sorteo) = 
		(self.valorApostado() * 70).min(sorteo.totalRecaudado() * 10 / 100)
}

class ApuestaALosPrimerosDos inherits ApuestaALaCabeza {
	override method valorPorDefecto() = 10

	override method esGanadora(sorteo) = 
		super(sorteo)
		||
		sorteo.numerosGanadores().get(1) == numeroApostado

	override method premio(sorteo) = 
		(valorApostado * 30).min(sorteo.totalRecaudado() * 5 / 100)
}


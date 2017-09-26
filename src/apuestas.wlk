
/**
 * A la cabeza: El jugador apuesta que su número quedará en la primera posición.
 * El premio es de 70 veces el valor de lo apostado con un máximo del 10 % del total
 * recaudado por el sorteo.
 */
class ApuestaALaCabeza {
	//	De cada apuesta nos va a interesar 
	//  - el valor apostado por el jugador, 
	//  - si es ganadora o no del sorteo, 
	//  - el monto del premio en caso de ser ganadora
	//	- el nombre del apostador.

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
	
	method esGanadora(sorteo) = sorteo.numerosGanadores().first() == numeroApostado
	
	method premio(sorteo) = (valorApostado * 70).min(sorteo.totalRecaudado() * 10 / 100)
}

class ApuestaALosPrimerosDos {
	var numeroApostado
	var valorApostado = 10
	var nombreApostador

	constructor(aQueNumero, quien) {
		numeroApostado = aQueNumero
		nombreApostador = quien		
	}

	method valorApostado() = valorApostado
	
	method posiblesGanadores(sorteo) = sorteo.numerosGanadores().subList(0, 1)
	method esGanadora(sorteo) = self.posiblesGanadores(sorteo).contains(numeroApostado) 

	method premio(sorteo) = (valorApostado * 30).min(sorteo.totalRecaudado() * 5 / 100)
}


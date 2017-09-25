
object sorteo {
	var apuestas = #{}
	
	/** Lista de los 5 números ganadores */
	var numerosGanadores
	
	method numerosGanadores() = numerosGanadores

	/** Determinar una manera de asignar los números ganadores */	
	method numerosGanadores(numeros) {
		numerosGanadores = numeros
	}
	
	/** Hacer que a un sorteo se le puedan agregar apuestas */ 
	method agregarApuesta(apuesta) {
		apuestas.add(apuesta)
	}
	
	method apuestasGanadoras() = apuestas.filter { apuesta => apuesta.esGanadora(self) }

	method apuestasPerdedoras() = apuestas.difference(self.apuestasGanadoras())
	
	/** Es la suma de todos los premios que se tienen que pagar. */
	method totalEnPremios() = self.apuestasGanadoras().sum { apuesta => apuesta.premio(self) }	

	method totalRecaudado() = apuestas.sum { apuesta => apuesta.valorApostado() }

	/** Son los nombres de los ganadores. */
	method ganadores() = self.apuestasGanadoras().map { apuesta => apuesta.nombreApostador() }
	 
	/** Es la diferencia entre el total recaudado y el total en premios. */
	method beneficio() = self.totalRecaudado() - self.totalEnPremios()
}

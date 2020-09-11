// Mensajeros de pelicula, primera parte

object paquete {
	var mensajero
	var pago
	var destino
 
    method puedeSerEntregado() = self.estaPago() and destino.dejaPasar(mensajero)
    
    method estaPago() = pago
    
    method estadoPago(estado) {
    	pago = estado
   }
   method elMensajero(mensajeroAsignado) {
   	    mensajero = mensajeroAsignado
   }
   method elDestino(destinoAsignado) {
   	    destino = destinoAsignado
   }
}

// Destinos:
object puenteDeBrooklin{
	method dejaPasar(mensajero) = mensajero.pesoQueCuenta() < 1000
}
object matrix{
	method dejaPasar(mensajero) = mensajero.puedeHacerUnaLlamada()
}


// Mensajeros:
object roberto{
	var peso
	var transporte
	var cantAcoplados
	
	method pesoQueCuenta() {
		if(transporte == "bicicleta"){
		 return peso + 1
	}   if(transporte == "camion"){
		 return peso + 500 * cantAcoplados
	} return 0
	}
	method puedeHacerUnaLlamada() = false
	
	method suPeso(suPeso) {
		peso = suPeso
	}
	method suTransporte(suTransporte){
		transporte = suTransporte
	}
	method cantAcoplados(acoplados){
		cantAcoplados = acoplados
	}
}
 
object chuckNorris {
	method pesoQueCuenta() = 900
	
	method puedeHacerUnaLlamada() = true
}

object neo{
	var estadoCredito
	
	method pesoQueCuenta() = 0
	
	method puedeHacerUnaLlamada() = self.tieneCredito()
	
	method tieneCredito() = estadoCredito
	
	method suCredito(estado){
		estadoCredito = estado
	}
}
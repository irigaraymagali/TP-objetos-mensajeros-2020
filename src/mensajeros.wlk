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
	
    method pesoQueCuenta() = peso + transporte.peso()
	
	method puedeHacerUnaLlamada() = false
	
	method suPeso(suPeso) {
		peso = suPeso
	}
	method suTransporte(suTransporte){
		transporte = suTransporte
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


// Transportes:
object camion{
	var cantAcoplados
	
	method peso() = 500 * cantAcoplados
	
	method cantAcoplados(acoplados){
		cantAcoplados = acoplados
	}
}
object bicicleta{
	method peso() = 1
}
// Mensajeros de pelicula, primera parte

object paquete {
	var pago
	var destino
	const precio = 50
 
    method puedeSerEntregado(mensajero) = self.estaPago() and destino.dejaPasar(mensajero)
    
    method estaPago() = pago
    
    method estadoPago(estado) {
    	pago = estado
   }
   method elDestino(destinoAsignado) {
   	    destino = destinoAsignado
   }
   method precio() = precio
}

object paquetito {
	var precio = 0
	
	method estaPago() = true
	
	method puedeSerEntregado(mensajero) = true
	
	method precio() = precio
}

object paquetonViajero {
	const precio = 100
	var pagoParcial
	var destinos = []
	
	method puedeSerEntregado(mensajero) = self.estaPago() and destinos.all({destino => destino.dejaPasar(mensajero)})
	
	method estaPago() = self.estaPagoTotalmente()
	
	method estaPagoTotalmente() = pagoParcial == precio
	
	method  pagoParcial(pago) {
		pagoParcial = pagoParcial + pago
	} 
	
    method precio() = precio
}

object nuevoPaquete {
	const precio = 10
	method puedeSerEntregado(mensajero) = true
	method precio() = precio
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
	var peso = 0
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

object nuevoMensajero {
	method pesoQueCuenta() = 10
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
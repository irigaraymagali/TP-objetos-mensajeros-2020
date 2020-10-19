import mensajeros.*

object mensajeria {
 var mensajeros = [] 
 var paquetesPendientes = []
 var paquetesEnviados = []
 var paquetes = []

  
 method contratarMensajero(unNuevoMensajero){
 	mensajeros.add(unNuevoMensajero)
 }
 
 method despedirMensajero(mensajeroDespedido){
 	mensajeros.remove(mensajeroDespedido)
 }
 
 method esGrande() = mensajeros.size() > 2
 
 method elPrimeroPuedeEntregarlo(paqueteAEntregar) = paqueteAEntregar.puedeSerEntregado(self.elPrimero())
 
 method elPrimero() = mensajeros.first()
          
 method pesoUltimoMensajero() = self.elUltimo().pesoQueCuenta()
 
 method elUltimo() = mensajeros.last()
 
 method despedirATodos() {
 	mensajeros.forEach({mensajero => self.despedirMensajero(mensajero)}) 
 }
 
 method agregarPaquete(unPaquete){
 	paquetes.add(unPaquete)
 }     
 
 
 // Punto 1
 method puedeEntregarPaquete(paqueteAEntregar) = mensajeros.any({mensajero => paqueteAEntregar.puedeSerEntregado(mensajero)})
 
 // Punto 2
 method losQueLoPuedenEntregar(paqueteAEntregar) = mensajeros.filter({mensajero => paqueteAEntregar.puedeSerEntregado(mensajero)})
 
 // Punto 3
 method tieneSobrepeso() = self.promedioPesoMensajeros() > 500
 
 method promedioPesoMensajeros() = self.sumatoriaPesos() / mensajeros.size()
 
 method sumatoriaPesos() = mensajeros.map({mensajero => mensajero.pesoQueCuenta()}).sum()
 
 // Punto 4
 method enviarPaquete(paqueteAEnviar) {
 	if(self.puedeEntregarPaquete(paqueteAEnviar)){
 	 	paquetesEnviados.add(paqueteAEnviar)     	    
 	} else{
 		 paquetesPendientes.add(paqueteAEnviar)          
 	}
 }

 // Punto 5
 method facturacion() = self.preciosPaquetes().sum()   
 
 method preciosPaquetes() = paquetesEnviados.map({unPaquete => unPaquete.precio()})
 
 // Punto 6
 method enviarTodos() = paquetes.forEach({paqueteAEnviar => self.enviarPaquete(paqueteAEnviar)})
 
 //Punto 7
 method enviarElMasCaro() {    
 	if(self.puedeEntregarPaquete(self.elPendienteMasCaro())){
 		self.enviarPaquete(self.elPendienteMasCaro())
 	    self.actualizarPendientes(self.elPendienteMasCaro())
 	} 
 } 
 
 method elPendienteMasCaro() = paquetesPendientes.max({unPaquete => unPaquete.precio()})
 
 method actualizarPendientes(paqueteEnviado) {
 	paquetesPendientes.remove(paqueteEnviado)
 }
 
 // Punto 8 : agregado en mensajeros.wlk
 
 // Para los tests:
 method cantidadPaquetesEnviados() = paquetesEnviados.size()
 method cantidadPaquetesPendientes() = paquetesPendientes.size() 
 method cantidadPaquetes() = paquetes.size()
 method cantidadMensajeros() = mensajeros.size()
    
 }



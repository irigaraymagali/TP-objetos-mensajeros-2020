import mensajeros.*

object mensajeria {
 var mensajeros = #{}
 var paquetesPendientes = []
 var paquetesEnviados = []
 var paquetes = []

  
 method contratarMensajero(nuevoMensajero){
 	mensajeros.add(nuevoMensajero)
 }
 
 method despedirMensajero(mensajeroDespedido){
 	mensajeros.remove(mensajeroDespedido)
 }
 
 method esGrande() = mensajeros.size() > 2
 
 method elPrimeroPuedeEntregarlo(paqueteAEntregar) = paqueteAEntregar.puedeSerEntregado(self.elPrimero())
 
 method elPrimero() = mensajeros.asList().first()
          
 method pesoUltimoMensajero() = self.elUltimo().pesoQueCuenta()
 
 method elUltimo() = mensajeros.asList().last()
 
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
 method facturacion() = self.precios().sum()   
 
 method precios() = paquetesEnviados.map({unPaquete => unPaquete.precio()})
 
 // Punto 6
 method enviarTodos() = paquetes.forEach({paqueteAEnviar => self.enviarPaquete(paqueteAEnviar)})
 
 //Punto 7
 method enviarElMasCaro() {    
 	if(self.puedeEntregarPaquete(self.elPendienteMasCaro())){
 		self.enviarPaquete(self.elPendienteMasCaro())
 	    paquetesPendientes.remove(self.elPendienteMasCaro())  // FALLA
 	} else {
 		// no hace nada
 	}
 } 
 
 method elPendienteMasCaro() = paquetesPendientes.max({unPaquete => unPaquete.precio()})
 
 // Punto 8 : agregado en mensajeros.wlk
 
 }



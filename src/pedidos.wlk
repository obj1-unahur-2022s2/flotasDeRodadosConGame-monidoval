class Pedido {
	const property distancia
	const property tiempo
	const property pasajeros
	const property coloresIncomp = #{}
	
	method velocidadRequerida() = distancia / tiempo
	method puedeSatisfacerPedido(unAuto) { return
		unAuto.velocidad() >= self.velocidadRequerida() + 10 &&
		unAuto.capacidad() >= pasajeros &&
		!coloresIncomp.contains(unAuto.color())
	}
	
}

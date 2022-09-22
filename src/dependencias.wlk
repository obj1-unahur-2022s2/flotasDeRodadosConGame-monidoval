import rodados.*

class Dependencia {
	const property flota = []
	var property cantEmpleados
	const property pedidos = []
	
	
	method agregarAFlota(unRodado) {
		flota.add(unRodado)
	}
	
	method quitarDeFlota(unRodado) {
		flota.remove(unRodado)
	}
	
	method agregarPedido(unPedido) {
		pedidos.add(unPedido)
	}
	
	method quitarPedido(unPedido) {
		pedidos.remove(unPedido)
	}
	
	method pesoTotalFlota() = flota.sum({r=>r.peso()})
	
	method estaBienEquipada() = self.cantidadDeRodados() >= 3 && self.todosVanAMasDe(100)
	
	method cantidadDeRodados() = flota.size()
	method todosVanAMasDe(unaVelocidad) = flota.all({r=>r.velocidad() >= unaVelocidad})
	
	method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({r=>r.capacidad()})
	//method capacidadTotalEnColor(color) = self.sumar(self.rodadosDeColor(color),{r=>r.capacidad()})
	method rodadosDeColor(color) = flota.filter({r=>r.color() == color})
	method sumar(lista,closure) = lista.sum(closure)
	
	method colorDelRodadoMasRapido() = self.elDeMaximaVelocidad().color()
	method elDeMaximaVelocidad() = flota.max({r=>r.velocidad()})
	
	method capacidadTotalFlota() = flota.sum({r=>r.capacidad()})
	method capacidadFaltante() = 0.max(cantEmpleados - self.capacidadTotalFlota())
	
	method esGrande() = self.cantidadDeRodados() >= 5 && cantEmpleados >= 40
	
	method totalPasajerosEnPedidos() = self.sumar(pedidos,{p=>p.pasajeros()})
	
	method pedidoPuedeSerSatisfecho(pedido) = flota.any({r=>pedido.puedeSatisfacerPedido(r)})
	
	method pedidosQueNoPuedenSerSatisfechos() = 
			pedidos.filter({p=>!self.pedidoPuedeSerSatisfecho(p)})
			
	method pedidoColorIncompatible(pedido,color) = pedido.coloresIncomp().contains(color)
	
	method pedidosConColorIncompatibles(color) = 
			pedidos.all({p=>self.pedidoColorIncompatible(p,color)})
			
	
}

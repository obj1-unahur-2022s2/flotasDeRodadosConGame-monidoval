
class Corsa {
	var color
	
	method capacidad() = 4
	method velocidad() = 150
	method peso() = 1300
	method color() = color
}

class Kwid {
	var property tieneTanqueAdicional = false
	
	method capacidad() {
		if(tieneTanqueAdicional) {return 3}
		else {return 4}
	}
	method velocidad() = if(tieneTanqueAdicional) 120 else 110
	method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
	method color() = "azul"
}

object trafic {
	var property motor = motorBataton
	var property interior = interiorPopular
	
	method velocidad() = motor.velocidad()
	method capacidad() = interior.capacidad()
	method peso() = 4000 + interior.peso() + motor.peso()
	method color() = "blanco"
}

object interiorComodo {
	method capacidad() = 5
	method peso() = 700
}

object interiorPopular {
	method capacidad() = 12
	method peso() = 1000
}

object motorBataton {
	method peso() = 500
	method velocidad() = 80
}

object motorPulenta {
	method peso() = 800
	method velocidad() = 130
}

class AutoEspecial {
	var property capacidad
	var property velocidad
	var property peso
	var property color
}
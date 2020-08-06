class Mosquito {
    var aguante = 1000
    var cantidadDePicados = 0

    method picar(persona) {
        aguante -= persona.peso()
        cantidadDePicados += 1
    }

    method aguante { return aguante }

    method picadorFrecuente() { return cantidadDePicados>3 }

    method quierePicar() { return aguante>500 }
}

class MosquitoPesado inherits Mosquito {
    var peso = 20
    override method picar(persona) {
        peso += persona.peso()/100.0
    }

    method peso() { return peso }
}

class MosquitoGloton inherits MosquitoPesado {
    override method quierePicar() {
        return super() and self.peso()>100
    }
}

class MosquitoConVeneno inherits Mosquito {
    var veneno = 20
    
    override method picar(persona) {
        super(persona)
        veneno -= 1
    }

    method descansar() {
        veneno += 15
    }
}

class MosquitoConVenenoMortal inherits MosquitoConVeneno {
    var mortalidad = 10
    
    override method picar(persona) {
        super(persona)
        mortalidad -= 2
    }

    override method descansar() {
        super()
        mortalidad += 5
    }

    method esMortal() {
        return mortalidad>10 and self.aguante()>2000
    }

    override method quierePicar() {
        return super() and mortalidad>4
    }
}

class MosquitoAguantador inherits MosquitoConVenenoMortal {
    override aguante() {
        return super() + 500
    }
}


class MosquitoConVenenoSabio inherits MosquitoConVeneno 
{
	override veneno() {
		return super() + 50
	}
}

class MosquitoFiaca inherits Mosquito 
{
	method quierePicar() 
	{
		return false 	
	}
}

class Estudiante {
    method peso() { return 40 }
}



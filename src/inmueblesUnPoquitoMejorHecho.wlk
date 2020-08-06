object casaAlpina 	{
	var property personasQuePuedenVivir = 0
}

object casaNormal {
	var property personasQuePuedenVivir = 0
}

object cabania {
	var property personasQuePuedenVivir = 0
}

object departamento {
	var property personasQuePuedenVivir = 3
}

class Inmueble {
    var property tipo = null
    var property color = null
    var caracteristicas = #{}  //todos los objetos que se agregan al inmueble
    var property cantidadAmbientes = 0

    method valor() {
        return cantidadAmbientes * 10000
            + caracteristicas.sum({cara => cara.valorizacion()})
    }

    method ponerPatio(superficie) { 
        const patio = new Patio()
        patio.superficie(superficie)
        caracteristicas.add( patio ) 
    }
    method ponerTechoTejas(cantidad) { 
        const techoTejas = new TechoTejas()
        techoTejas.cantidadTejas(cantidad)
        caracteristicas.add( techoTejas ) 
    }
    method ponerTechoLoza() { 
        const techoLoza = new TechoLoza()
        caracteristicas.add( techoLoza ) 
    }
    
    method ponerLavadero() {
    	const lavadero = new Lavadero()
    	caracteristicas.add (lavadero)
    }
    
    method ponerJardin() {
     const jardin = new Jardin()
     caracteristicas.add(jardin)
    }
    
    method ponerEstablo() {
    	const establo = new Establo()
    	caracteristicas.add(establo)
    }
    
    method ponerBaulera() {
    	const baulera = new Baulera()
    	caracteristicas.add(baulera)
    }
    // Así para lavadero, jardín, establo, baulera
}

class Patio {
	var property superficie = 0
	
	method valorizacion() {return superficie * 4}
}

class TechoTejas {
	var property cantidadTejas = 0
	
	method valorizacion() {return cantidadTejas + 100}
}

class TechoLoza {
	var property valorizacion = 1000
	var property cantidadLozas = 0
}

class Lavadero {
	var property valorizacion = 300
}

class Jardin {
	var property valorizacion = 4000
}

class Establo {
	var property valorizacion = 15000
}

class Baulera {
	var property valorizacion = 2500
}



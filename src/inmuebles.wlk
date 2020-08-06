object armado {
    method armar(unInmueble, unColor) {
        if (unInmueble.tipo() == "casa alpina") {
            unInmueble.ponerAmbientes(4)
            unInmueble.ponerPatio(50)
            unInmueble.ponerLavadero()
            unInmueble.ponerJardin()
            unInmueble.ponerTechoTejas(800)
        } else if (unInmueble.tipo() == "casa normal") {
            unInmueble.ponerAmbientes(4)
            unInmueble.ponerPatio(30)
            unInmueble.ponerLavadero()
            unInmueble.ponerJardin()
            unInmueble.ponerTechoLoza()
        } else if (unInmueble.tipo() == "cabania") {
            unInmueble.ponerAmbientes(2)
            unInmueble.ponerEstablo()
            unInmueble.ponerJardin()
            unInmueble.ponerLavadero()
            unInmueble.ponerTechoTejas(300)
        }
        unInmueble.pintar(unColor)
    }
}

class Inmueble {
    var property tipo = null
    var color = null
    var caracteristicas = #{} // todos los objetos que se agregan al inmueble
    var cantidadAmbientes = 0

    method tipo() { return tipo }
    method color() { return color }

    method pintar(unColor) { color = unColor }

    method valor() {
        return cantidadAmbientes * 10000
            + caracteristicas.sum({cara => cara.valorizacion()})
    }

    method ponerAmbientes(cant) { cantidadAmbientes = cant }

    method cuantaGentePuedeVivir() {
        if (unInmueble.tipo() == "casa alpina") {
            return cantidadAmbientes - 1
        } else if (unInmueble.tipo() == "casa normal") {
            return cantidadAmbientes + 1
        } else if (unInmueble.tipo() == "cabania") {
            return 5
        }
    }
    method ponerPatio(superficie) { 
        const patio = new Caracteristica()
        patio.tipo("patio")
        patio.superficiePatio(superficie)
        caracteristicas.add( patio ) 
    }
    method ponerTechoTejas(cantidad) { 
        const techo = new Caracteristica()
        techo.tipo("techoTejas")
        techo.cantidadTejas(cantidad)
        caracteristicas.add( techo ) 
    }
    method ponerTechoLoza() { 
        const techo = new Caracteristica()
        techo.tipo("techoLoza")
        caracteristicas.add( techo ) 
    }
    // Así para lavadero, jardín, establo, baulera
}


class Caracteristica {
    var property tipo
    var property superficiePatio = 0
    var property cantidadTejas = 0

    method valorizacion() {
        if (tipo == "patio") {
            return superficiePatio * 4
        } else if (tipo == "techoTejas") {
            return cantidadTejas + 100
        } else if (tipo == "techoLoza") {
            return 1000
        } else if (tipo == "lavadero") {
            return 300
        } else if (tipo == "jardin") {
            return 4000
        } else if (tipo == "establo") {
            return 15000
        } else if (tipo == "baulera") {
            return 2500
        }
    }
}

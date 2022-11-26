import UIKit

//MIS CONSTANTES

struct Person {
    let nombre: String
    let apepat: String
    let apemat: String
    let fecha: String
    let documento: String
    let sexo: String
    let correo: String
    let hermanos: Int
    var usuario: String?
    
    
    init(nombre:String,apepat:String,apemat:String,fecha:String,documento:String,sexo:String,correo:String,hermanos:Int,usuario:String?=nil){
            self.nombre=nombre
            self.apepat=apepat
            self.apemat=apemat
            self.fecha=fecha
            self.documento=documento
            self.sexo=sexo
            self.correo=correo
            self.hermanos=hermanos
            self.usuario=usuario
        }
    
}


var listPersonas=[
Person(nombre:"CARLOS JOSÉ",apepat:"ROBLES",apemat:"GOMES",fecha:"06/08/1995",documento:"78451245",sexo:"m", correo:"carlos.roblesg@hotmail.com",hermanos:2),
Person(nombre:"MIGUEL ANGEL",apepat:"QUISPE",apemat:"OTERO",fecha:"28/12/1995",documento:"79451654",sexo:"m", correo:"miguel.anguel@gmail.com",hermanos:0),
Person(nombre:"KARLA ALEXANDRA",apepat:"FLORES",apemat:"ROSAS",fecha:"15/02/1997",documento:"77485812",sexo:"f", correo:"Karla.alexandra@hotmail.com",hermanos:1),
Person(nombre:"NICOLAS",apepat:"QUISPE",apemat:"ZEBALLOS",fecha:"08/10/1990",documento:"71748552",sexo:"m", correo:"nicolas123@gmail.com",hermanos:1),
Person(nombre:"PEDRO ANDRE",apepat:"PICASSO",apemat:"BETANCUR",fecha:"17/05/1994",documento:"74823157",sexo:"m", correo:"pedroandrepicasso@gmail.com",hermanos:2),
Person(nombre:"FABIOLA MARIA",apepat:"PALACIO",apemat:"VERA",fecha:"02/02/1992",documento:"76758254",sexo: "f",correo:"fabi@hotmail.com",hermanos:0)
]


func getGenero(_ personas : Array<Person>,_ genero: String) ->Array<Person>{
    
    let listaGenero=personas.filter{$0.sexo==genero}
    return listaGenero;
}

func getHermanos (_ personas : Array<Person>,_ hermanos: Int) ->Array<Person>{
    let listaHermanos=personas.filter{$0.hermanos>hermanos}
    return listaHermanos
}

func formatDate(_ fecha:String) ->Date {
    
    let fechaNacimiento=fecha
    let dateFormat=DateFormatter()
    dateFormat.dateFormat="dd/MM/yy"
    let fechaNacimientoResponse = dateFormat.date(from: fechaNacimiento)
    return fechaNacimientoResponse!

}

func getEdad(_ fecha:String) -> Int {
    
    let fechaNacimiento=formatDate(fecha)
    let date=Date()

    let calendar=Calendar.current
    let fechaNac=calendar.dateComponents( [.day, .month, .year], from:fechaNacimiento)
    let fechaActual=calendar.dateComponents( [.day, .month, .year], from:date)
    let fechaInicio=DateComponents(year:fechaNac.year,month: fechaNac.month,day: fechaNac.day)
    let fechaFinal=DateComponents(year:fechaActual.year,month: fechaActual.month,day: fechaActual.day)
    let resultYears=calendar.dateComponents( [.year], from: fechaInicio, to: fechaFinal)

    return resultYears.year ?? 0

}

func getMayorEdad(_ personas : Array<Person>) -> String {

    let indexPersona=personas[0]
    var edadMenor = getEdad(indexPersona.fecha)
    var nombre:String?
     for persona in personas {
        
         var edad=getEdad(persona.fecha)
         if edadMenor < edad{
            edadMenor = edad
             nombre=persona.nombre
         }

    }
    
    return nombre!
}


func getMenorEdad(_ personas : Array<Person>) -> String {

    let indexPersona=personas[0]
    var edadMenor = getEdad(indexPersona.fecha)
    var nombre:String?
     for persona in personas {
        
         var edad=getEdad(persona.fecha)
         if edadMenor > edad{
            edadMenor = edad
             nombre=persona.nombre
         }

    }
    
    return nombre!
}


func generateUsername(_ correo:String) -> String{
    
    let username:String! = correo.components(separatedBy: "@").first!
    return username!
}

func getUsuarios(_ personas : Array<Person>) -> Array<Person> {
    
    
    for (index, item)in personas.enumerated() {
    
        let username = generateUsername(item.correo)
        listPersonas[index].usuario = username
    }
    return listPersonas
}

func formatUsuarios() {
    let nombre = listPersonas.map{$0.nombre.components(separatedBy: " ").first!.capitalized}
    let apellidoP = listPersonas.map{$0.apepat.capitalized}
    let apellidoM = listPersonas.map{$0.apemat.first ?? " "}
    
    for (index, _) in listPersonas.enumerated() {
        print("\(nombre[index]) \(apellidoP[index]) \(apellidoM[index]).")
        print("")
    }
}
    


    
    let cantidadMujeres = getGenero(listPersonas, "f").count
    let cantidadHombres = getGenero(listPersonas, "m").count
    let cantidadHermanos = getHermanos(listPersonas, 2).count
    let edadMayor = getMayorEdad(listPersonas)
    let edadMenor = getMenorEdad(listPersonas)
    let usuarios = getUsuarios(listPersonas)
    

    
    print("-----LISTA DE DATOS-------")
    print("Mujeres: \(cantidadMujeres)")
    print("")
    print("Hombres: \(cantidadHombres)")
    print("")
    print("Personas con más de 2 hermanos: \(cantidadHermanos)")
    print("")
    print("Nombre de la persona con mayor edad: \(edadMayor)")
    print("")
    print("Nombre de la persona con menor edad: \(edadMenor)")
    print("")
    print("------Personas con formato:------")
    print("")
    formatUsuarios()
    print("------Personas con usuario:------")
    print("")
    print("\(usuarios)")
    

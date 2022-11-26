//
//  StructRecetas.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//

import Foundation

struct Receta : Codable {
    let imagen: String
    let nombre: String
    let ingredientes: String
    let detalle: detalleReceta
}

public struct detalleReceta : Codable {
    let descripcion: String
    var latitud: String
    var longitud: String
}

class sReceta {
    var codigo: String = ""
    var nombre: String = ""
    var unidad_medida: String = ""
    var fecha: String = ""
    var valor: Double = 0.0
}

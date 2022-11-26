//
//  ModelReceta.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//

import Foundation
import RealmSwift

class ModelReceta: Object, Decodable {
    // MARK: - attributes
    @objc dynamic var imagen: String
    @objc dynamic var nombre: String
    @objc dynamic var descripcion: String
    @objc dynamic var latitud: String
    @objc dynamic var longitud: String
    // MARK: - PK
    @objc open override class func primaryKey() -> String {
        return "nombre"
    }
    // MARK: - init
    convenience init(
        imagen: String,
        nombre: String,
        descripcion: String,
        latitud: String,
        longitud: String
    ){
        self.init()
        self.imagen = imagen
        self.nombre = nombre
        self.descripcion = descripcion
        self.latitud = latitud
        self.longitud = longitud
    }

}

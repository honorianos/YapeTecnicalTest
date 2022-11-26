//
//  RecetaDao.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//

import Foundation
import RealmSwift

public class RecetaDao {
    
    init(){
        
    }
    func getByCodigo(nombre: String) -> Results<ModelReceta> {
        let results: Results<ModelReceta> = db.objects(ModelReceta.self).filter("nombre = %@", nombre)
        return results
    }
   
    func insert(receta: ModelReceta) -> Void {
        try! db.write {
            db.add(receta, update: .all)
        }
    }
    
    func getByNombreNoExiste(nombre: String) -> Bool {
        let results: Results<ModelReceta> = db.objects(ModelReceta.self).filter("nombre = %@", nombre)
        if results.count == 0{
            return true
        }else{
            return false
        }
    }
    
    func deleteAllFromDatabase()  {
        try!   db.write {
            db.deleteAll()
        }
    }
    
    func getallRecetas() -> [ModelReceta] {
        let results: Results<ModelReceta> = db.objects(ModelReceta.self)
        var recetas = [ModelReceta]()
        for i in results {
            let tmp = ModelReceta(
                imagen: i.imagen,
                nombre: i.nombre,
                descripcion: i.descripcion,
                latitud: i.latitud,
                longitud: i.longitud
            )
            recetas.append(tmp)
        }
        return recetas
    }
    
}

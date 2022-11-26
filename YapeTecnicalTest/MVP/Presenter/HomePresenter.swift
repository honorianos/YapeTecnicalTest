//
//  HomePresenter.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//

import UIKit
import JGProgressHUD
import RealmSwift
import CryptoSwift

protocol HomePresenterDelegate: AnyObject {
    func presentGetReceta(recetas :[Receta])
}

typealias PresenterHomeDelegate = HomePresenterDelegate & UIViewController

class HomePresenter {
    weak var  delegate: PresenterHomeDelegate?
    private let utils = Utils()
    private let loader = JGProgressHUD(style: .light)
    private let connectRequest = APIconnect()
    private let bdMaster = RecetaDao()
    private var items = [Receta]()
    public func setViewDelegate(delegate: PresenterHomeDelegate) {
        self.delegate = delegate
        self.loader.textLabel.text = "Cargando"
    }
    
    public func getDataRecetas() {
        loader.show(in: (delegate?.view)!)
        connectRequest.getRecetas(urlString: Utils.baseUrl ){ [self] (response) in
            loader.dismiss()
            guard let responseData = response?.data else { return}
            let valido = self.parseRecetas(responseData)
            if (valido){
                self.delegate?.presentGetReceta(recetas: items)
            }else{
                self.utils.showSimpleAlert(titulo: "Atención", mensaje: "Error al cargar Data", vc: self.delegate!)
            }
        }
        
        
    }

    func parseRecetas(_ datos: Data)-> Bool {
        do{
            let decoder = JSONDecoder()
            let Data = try decoder.decode([Receta].self, from: datos)
            for i in Data {
                items.append(
                    Receta(imagen: i.imagen,
                           nombre: i.nombre,
                           ingredientes: i.ingredientes,
                           detalle: i.detalle)
                )
            }
            for i in items {
                if (bdMaster.getByNombreNoExiste(nombre: i.nombre)) {
                    bdMaster.insert(receta: ModelReceta(
                        imagen: i.imagen,
                        nombre: i.nombre,
                        descripcion: i.detalle.descripcion,
                        latitud: i.detalle.latitud,
                        longitud: i.detalle.longitud
                    ))
                }
            }
            return true
        } catch {
            print(error)
            utils.showSimpleAlert(titulo: "Atención", mensaje: "Ocurrio un error.", vc: self.delegate!)
            return false
        }
    }
    
    
   
}

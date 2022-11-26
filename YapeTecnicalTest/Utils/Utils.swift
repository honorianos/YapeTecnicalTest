//
//  Utils.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//

import Foundation
import UIKit

public class Utils{

    static let key = "MW9waTJieTQzcHViaXQ1Mw=="
    static let iV = "em1wMzI0NWlvNW9pNDJ6dQ=="
    static let keyDecrypt = "1opi2by43pubit53"
    static let ivDecrypt = "zmp3245io5oi42zu"
    static let baseUrl = "https://f21c3a29-cde6-446d-82bf-f8997b1e3f12.mock.pstmn.io/recetas"
    
    public func showSimpleAlert(titulo: String, mensaje: String, vc: UIViewController, okBtn: String = "Aceptar"){
        let alertOffline = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertOffline.addAction(UIAlertAction(title: okBtn, style: .default, handler: nil))
        vc.present(alertOffline, animated: true, completion: nil)
    }
}

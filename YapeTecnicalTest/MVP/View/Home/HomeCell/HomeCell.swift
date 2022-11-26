//
//  HomeCell.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 25/11/22.
//


import UIKit
import Kingfisher

class HomeCell: UITableViewCell {
    @IBOutlet weak var imgReceta: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    func bindData(data: Receta) {
        let url = URL(string: data.imagen)
        imgReceta.kf.setImage(with: url)
        lblName.text = String("\(data.nombre)")
    }
}

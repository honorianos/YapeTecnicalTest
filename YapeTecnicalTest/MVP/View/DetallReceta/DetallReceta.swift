//
//  DetallReceta.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 26/11/22.
//

import UIKit
import Kingfisher

//-----------------------------------------------------------------------------------------------------------------------------------------------
class DetallReceta: UIViewController {

    @IBOutlet var imageFood: UIImageView!
    @IBOutlet var detailIngredients: UILabel!
    @IBOutlet var detailPreparation: UILabel!
    private let presenter = DetailRecetaPresenter()
    var viewData :Receta!

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Detalle \(viewData.nombre)"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }

    // MARK: - Data methods
    //-------------------------------------------------------------------------------------------------------------------------------------------
    func loadData() {
        let url = URL(string: viewData.imagen)
        imageFood.kf.setImage(with: url)
        detailIngredients.text = viewData.ingredientes
        detailPreparation.text = viewData.detalle.descripcion
    }

    // MARK: - User actions
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func didTapOrigen(_ sender: UIButton) {
        let vc = DetailMapReceta()
        vc.origen = viewData
        navigationController?.pushViewController(vc, animated: true)
    }
}

//
//  DetallRecetaPresenter.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 26/11/22.
//

import UIKit

protocol DetailRecetaPresenterDelegate: AnyObject {
}

typealias PresenterDetailDelegate = DetailRecetaPresenterDelegate & UIViewController

class DetailRecetaPresenter {
    weak var  delegate: DetailRecetaPresenterDelegate?
}

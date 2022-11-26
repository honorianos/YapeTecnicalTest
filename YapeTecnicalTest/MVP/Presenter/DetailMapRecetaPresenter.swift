//
//  DetailMapRecetaPresenter.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 26/11/22.
//

import UIKit

protocol DetailMapRecetaPresenterDelegate: AnyObject {
}

typealias PresenterDetailMapDelegate = DetailMapRecetaPresenterDelegate & UIViewController

class DetailMapRecetaPresenter {
    weak var  delegate: DetailMapRecetaPresenterDelegate?
}

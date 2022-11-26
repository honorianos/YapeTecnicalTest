//
//  UITextField+Extension.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//


import UIKit

extension UITextField {

    func setLeftPadding(value: Int) {

        self.leftView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: value, height: value)))
        self.leftViewMode = .always
    }

    func setRightPadding(value: Int) {

        self.rightView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: value, height: value)))
        self.rightViewMode = .always
    }
}

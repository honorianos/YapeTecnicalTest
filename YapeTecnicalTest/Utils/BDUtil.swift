//
//  BDUtil.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//
import Foundation

class BDUtil {
    static let keychain = KeychainSwift()
    static func initBd() {
        BDUtil.keychain.set(Credentials.Usuario, forKey: Credentials.keyUsuario)
        BDUtil.keychain.set(Credentials.Password, forKey: Credentials.keyPassword)
    }
}

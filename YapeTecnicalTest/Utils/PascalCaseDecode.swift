//
//  PascalCaseDecode.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//

import Foundation
extension JSONDecoder.KeyDecodingStrategy {
    static var convertFromPascalCase: JSONDecoder.KeyDecodingStrategy {
        return .custom { keys -> CodingKey in
            let key = keys.last!
            guard key.intValue == nil else {
                return key
            }
            let codingKeyType = type(of: key)
            let newStringValue = key.stringValue.firstCharLowercased()
            return codingKeyType.init(stringValue: newStringValue)!
        }
    }
}

private extension String {
    func firstCharLowercased() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}

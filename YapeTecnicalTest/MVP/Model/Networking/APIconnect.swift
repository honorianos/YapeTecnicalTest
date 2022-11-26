//
//  APIconnect.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//

import Foundation
import Alamofire

class APIconnect{
    typealias QueryResult = (DataResponse<Any>?) -> ()
    

    func getRecetas(urlString: String, completion: @escaping QueryResult){
        let uri = URL(string: urlString)
        var request = URLRequest(url: uri!)
        request.httpMethod = HTTPMethod.get.rawValue
        Alamofire.request(request).responseJSON{ (response) in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            if response.error != nil {
                print(" ERORR** \(response.error!)")
            }
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }

    
   
}

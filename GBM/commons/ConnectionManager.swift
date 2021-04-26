//
//  ConnectionManager.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import Foundation

enum RequestMethod {
    case post, get
}

enum RequestError: Error {
    case connectionFailed
}
typealias Parameter = (key: String, value: String)

final class ConnectionManager {
    
    class func request(from url: String,
                       params: Parameter...,
                       completion: @escaping (Result<Data, RequestError>) -> Void) {
        guard let urlComponents = URLComponents(string: url) else {
            completion(.failure(.connectionFailed))
            return
        }
        var paramsString = ""
        for param in params {
            paramsString.append("\(param.key):\(param.value)")
        }
        guard let url = urlComponents.url else {
            completion(.failure(.connectionFailed))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, !(error is URLError) else {
                    completion(.failure(.connectionFailed))
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
}

//
//  Endpoint.swift
//  Swift-NetworkLayer
//
//  Created by Batuhan Kucukyildiz on 18.08.2023.
//

import Foundation

// MARK: This liblary was created for generic network layer

protocol HttpProtocol{
    // MARK: Property
    var baseUrl : String {get}
    var path : String {get}
    var endpoint : HttpMethod {get}
    var header : [String : String]? {get}
    // MARK: Function
    func request() -> URLRequest
}

enum HttpMethod : String{
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}
enum Endpoint {
    case getUser
}


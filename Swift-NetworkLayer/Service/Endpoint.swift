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
    var method : HttpMethod {get}
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


extension Endpoint : HttpProtocol{
    var baseUrl: String {
        return "localhost:3000"
    }
    
    var path: String {
        switch self {
        case .getUser : return "/users"
        }
    }
    
    var method: HttpMethod {
        switch self{
        case .getUser : return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    // bu kısımda request bize urlSession.dataTask(with: kısmına girdiğimiz url dönüyor bizde bu sayede temiz bir endpoint kullanabiliyoruz.)
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseUrl) else {
            fatalError("UrlError")
        }
        components.path = path
        var request = URLRequest(url : components.url!)
        request.httpMethod = method.rawValue
        if let header = header {
            for (key , value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
        // requestin hangi değeri döndüğü bakılacak normalde with kısmına url girdiğimiz için bu yapıya uygun dönmesi gerekmekte
    }
}

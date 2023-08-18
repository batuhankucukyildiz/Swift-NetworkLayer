//
//  NetworkManager.swift
//  Swift-NetworkLayer
//
//  Created by Batuhan Kucukyildiz on 18.08.2023.
//

import Foundation


class NetworkManager{
    static let shared = NetworkManager()
    
    func request <T : Decodable>(_ endpoint : Endpoint ,completion : @escaping (Result<T? , Error>) -> Void ) -> Void {
        let networkManagerTask = URLSession.shared.dataTask(with: endpoint.request()) {data ,response , error in
            
            if let error = error{
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 , response.statusCode <= 500 else{
                completion(.failure(NSError(domain: "Invalid Error", code: 0)))
                return 
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid Error", code: 0)))
                return
            }
            do{
                let decodedData = try? JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch let error {
                completion(.failure(error))
            }
        }
        networkManagerTask.resume()
    }
    
    func getUser(){
        //
    }
    
}

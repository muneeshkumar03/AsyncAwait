//
//  APIManager.swift
//  AsyncAwait
//
//  Created by Muneesh Kumar on 25/05/24.
//

import Foundation

class APIManager {
    let baseUrl = "https://api.escuelajs.co/api/v1/"
    func sendRequest<T: Codable, U: Codable>(method: String, endPoint: String, parameters: T?, completion: @escaping (Result<U, Error>) -> ()) async {
        let completeURL = baseUrl + endPoint
        
        guard let url = URL(string: completeURL) else { 
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        if let params = parameters, (method == "post" || method == "put") {
            do {
                urlRequest.httpBody = try JSONEncoder().encode(params)
            } catch {
                completion(.failure(error))
            }
        }
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "Invalid response", code: 0)))
                return
            }
            let responseCode = httpResponse.statusCode
            
            if responseCode == 200 {
                let model = try JSONDecoder().decode(U.self, from: data)
                completion(.success(model))
            } else {
                completion(.failure(NSError(domain: "Invalid response code \(httpResponse.statusCode)", code: 0)))
            }
        } catch {
            completion(.failure(error))
        }
    }
}

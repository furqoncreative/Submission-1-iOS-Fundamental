//
//  ApiService.swift
//  Game Center
//
//  Created by Dicoding Reviewer on 20/08/21.
//

import Foundation

enum ErrorCase: Error {
    case errorUrl
    case noData
    case errorMessage(String)
    case statusCode(Int)
}

class ApiService {
    static let shared = ApiService()
    func getData<T: Codable> (from urlString: String, queryItems: [URLQueryItem]? = nil, completion: @escaping ((Result<T, ErrorCase>), URLResponse?) -> Void) {
        var components = URLComponents(string: urlString)!
        components.queryItems = []
        if let queryItems = queryItems {
            components.queryItems = queryItems
        }
        components.queryItems?.append(URLQueryItem(name: "key", value: Constant().apiKey))
        guard let url = components.url else {
            return completion(.failure(.errorUrl), nil)
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData), response)
            }
            guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                return completion(.failure(.errorMessage(data.jsonToString())), response)
            }
            completion(.success(decoded), response)
        }.resume()
    }
}

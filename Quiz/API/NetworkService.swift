//
//  NetworkService.swift
//  Quiz
//
//  Created by Александр Меренков on 3/17/22.
//

import UIKit
import Alamofire

struct NetworkService {
    static let shared = NetworkService()
    
    let urlSite = "https://quizapi.io/api/v1/questions?"
    let api = "apiKey=6nBiIpBnHuQRJAUyBWEzPNXwfXicTDeTJXQngkai"
    
    func loadQuestion(category: String, limit: String, completion: @escaping(([JsonQuestion]) -> Void)) {
        let category = "&category=" + category
        let limit = "&liimit=" + limit
        let urlRequest = urlSite + api + limit + category
        
        AF.request(urlRequest).responseDecodable(of: [JsonQuestion].self) { response in
            guard let result = response.value else { return }
            completion(result)
        }
    }
}

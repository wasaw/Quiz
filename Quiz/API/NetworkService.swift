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
    
//    MARK: - Properties
    
    let urlSite = "https://quizapi.io/api/v1/questions?"
    let api = "apiKey=6nBiIpBnHuQRJAUyBWEzPNXwfXicTDeTJXQngkai"
    
//    MARK: - Helpers
    
    func loadQuestion(category: String, limit: String, completion: @escaping(([JsonQuestion]) -> Void)) {
        let category = "&category=" + category
        let limit = "&limit=" + limit
        let urlRequest = urlSite + api + category + limit
        
        AF.request(urlRequest).responseDecodable(of: [JsonQuestion].self) { response in
            guard let result = response.value else { return }
            completion(result)
        }
    }
}

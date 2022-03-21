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
    let limited = "&limit=10"
    let url: String
    
    init() {
        url = self.urlSite + self.api + self.limited
    }
    
    
    func loadQuestion(completion: @escaping(([JsonQuestion]) -> Void)) {
        AF.request(url).responseDecodable(of: [JsonQuestion].self) { response in
            guard let result = response.value else { return }
            completion(result)
        }
    }
}

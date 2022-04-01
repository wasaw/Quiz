//
//  DatabaseService.swift
//  Quiz
//
//  Created by Александр Меренков on 3/29/22.
//

import UIKit
import RealmSwift

struct DatabaseService {
    static let shared = DatabaseService()

//    MARK: - Properties
    
    let realm = try? Realm()
    
//    MARK: - Helpers
    
    func saveResult(_ result: Result) {
        guard let realm = realm else { return }
        DispatchQueue.main.async {
            try? realm.write({
                realm.add(result)
            })
        }
    }
    
    func loadResult() -> [Result] {
        guard let realm = realm else { return [Result]() }
        let answer = realm.objects(Result.self)
        let sortedAnswer = Array(answer.sorted(byKeyPath: "percentRightAnswer", ascending: false))
        return sortedAnswer
    }
}

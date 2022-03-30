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
    
    let realm = try! Realm()

//    MARK: - Helpers
    
    func saveResult(_ result: Result) {
        DispatchQueue.main.async {
            try! realm.write({
                realm.add(result)
            })
        }
    }
}

//
//  Result.swift
//  Quiz
//
//  Created by Александр Меренков on 3/30/22.
//

import RealmSwift

class Result: Object {
    @objc dynamic var nickname = ""
    @objc dynamic var topic = ""
    @objc dynamic var answer = 0
    @objc dynamic var percentRightAnswer: Float = 0.0
}

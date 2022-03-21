//
//  Question.swift
//  Quiz
//
//  Created by Александр Меренков on 3/18/22.
//

struct JsonQuestion: Decodable {
    let id: Int
    let question: String
    let difficulty: String
    let category: String
    let multiple_correct_answers: String
    let answers: Answers
    let correct_answers: CorrectAnswer
    
    var answerArray: [String] {
        get {
            var array = [String]()
            if answers.answer_a != nil {
                array.append(answers.answer_a!)
            }
            if answers.answer_b != nil {
                array.append(answers.answer_b!)
            }
            if answers.answer_c != nil {
                array.append(answers.answer_c!)
            }
            if answers.answer_d != nil {
                array.append(answers.answer_d!)
            }
            if answers.answer_e != nil {
                array.append(answers.answer_e!)
            }
            if answers.answer_f != nil {
                array.append(answers.answer_f!)
            }
            return array
        }
    }
    
    var rightAnswer: Int {
        get {
            if correct_answers.answer_b_correct == "true" { return 1 }
            if correct_answers.answer_c_correct == "true" { return 2 }
            if correct_answers.answer_d_correct == "true" { return 3 }
            if correct_answers.answer_e_correct == "true" { return 4 }
            if correct_answers.answer_f_correct == "true" { return 5 }
            return 0
        }
    }
}

struct Answers: Decodable {
    let answer_a: String?
    let answer_b: String?
    let answer_c: String?
    let answer_d: String?
    let answer_e: String?
    let answer_f: String?
}

struct CorrectAnswer: Decodable {
    let answer_a_correct: String?
    let answer_b_correct: String?
    let answer_c_correct: String?
    let answer_d_correct: String?
    let answer_e_correct: String?
    let answer_f_correct: String?
}

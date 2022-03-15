//
//  QuestionForm.swift
//  Quiz
//
//  Created by Александр Меренков on 3/14/22.
//

import UIKit

class QuestionForm: UIView {
    
//    MARK: - Properties
    
    var questionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Some text"
        textView.font = UIFont.boldSystemFont(ofSize: 24)
        textView.textColor = .fontColor
        textView.backgroundColor = .questionFormBackground
        return textView
    }()
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(questionTextView)
        questionTextView.translatesAutoresizingMaskIntoConstraints = false
        questionTextView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        questionTextView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        questionTextView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        questionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  RecordPopView.swift
//  Quiz
//
//  Created by Александр Меренков on 3/29/22.
//

import UIKit

protocol SaveResultDelegate: class {
    func saveResult()
}

class RecordPopView: UIView {
    
//    MARK: - Properties
    
    let nicknameTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.attributedPlaceholder = NSAttributedString(string: "Введите никнейм", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        tf.textColor = .black
        tf.layer.borderWidth = 2
        return tf
    }()
    
    let allAnswerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    let percentRightAnswerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setAttributedTitle(NSAttributedString(string: "Сохранить", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]), for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 5))
    weak var delegate: SaveResultDelegate?
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        configureNicknameTextField()
        configureRightAnswerLabel()
        configurePercentAnswerLabel()
        configureSaveButton()
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    func configureNicknameTextField() {
        addSubview(nicknameTextField)
        
        nicknameTextField.translatesAutoresizingMaskIntoConstraints = false
        nicknameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
        nicknameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        nicknameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        nicknameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nicknameTextField.leftView = paddingView
        nicknameTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    func configureRightAnswerLabel() {
        addSubview(allAnswerLabel)
        
        allAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        allAnswerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
        allAnswerLabel.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: 15).isActive = true
        allAnswerLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        allAnswerLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func configurePercentAnswerLabel() {
        addSubview(percentRightAnswerLabel)
        
        percentRightAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        percentRightAnswerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
        percentRightAnswerLabel.topAnchor.constraint(equalTo: allAnswerLabel.bottomAnchor, constant: 15).isActive = true
        percentRightAnswerLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        percentRightAnswerLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func configureSaveButton() {
        addSubview(saveButton)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
        saveButton.topAnchor.constraint(equalTo: percentRightAnswerLabel.bottomAnchor, constant: 15).isActive = true
        saveButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        saveButton.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
    }
    
//    MARK: - Helpers
    
    @objc func handleSaveButton() {
        delegate?.saveResult()
    }
}

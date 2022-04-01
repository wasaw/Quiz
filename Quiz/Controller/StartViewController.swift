//
//  StartViewController.swift
//  Quiz
//
//  Created by Александр Меренков on 3/21/22.
//

import UIKit

class StartViewController: UIViewController {
    
//    MARK: - Properties
    private let questionForm = QuestionForm()
    private let categoryChoicePicker = CategoryChoice()
    private var stack = UIStackView()
    private let limitButtonFive = LimitButton()
    private let limitButtonTen = LimitButton()
    private let limitButtonTwentyFive = LimitButton()
    private var limitButtonArray = [LimitButton]()
    private var limit = 1
    private let submitButton = Button(title: "Начать", background: .white, font: .gray)
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        limitButtonArray = [limitButtonFive, limitButtonTen, limitButtonTwentyFive]
        configureUI()
        
        view.backgroundColor = .backgroundColor
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        configureQuestionForm()
        configureCategoryChoice()
        configureLimitButtons()
        configureStartButton()
    }
    
    private func configureQuestionForm() {
        view.addSubview(questionForm)
        
        questionForm.translatesAutoresizingMaskIntoConstraints = false
        questionForm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        questionForm.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        questionForm.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        questionForm.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        questionForm.questionTextView.text = "Выберите подходящую категорию"
    }
    
    private func configureCategoryChoice() {
        view.addSubview(categoryChoicePicker)
        
        categoryChoicePicker.translatesAutoresizingMaskIntoConstraints = false
        categoryChoicePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        categoryChoicePicker.topAnchor.constraint(equalTo: questionForm.bottomAnchor, constant: 10).isActive = true
        categoryChoicePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        categoryChoicePicker.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func configureLimitButtons() {
        view.addSubview(limitButtonFive)
        limitButtonFive.setTitle("5", for: .normal)
        limitButtonFive.tag = 5
        limitButtonFive.addTarget(self, action: #selector(handleButton), for: .touchUpInside)

        view.addSubview(limitButtonTen)
        limitButtonTen.setTitle("10", for: .normal)
        limitButtonTen.tag = 10
        limitButtonTen.addTarget(self, action: #selector(handleButton), for: .touchUpInside)

        view.addSubview(limitButtonTwentyFive)
        limitButtonTwentyFive.setTitle("25", for: .normal)
        limitButtonTwentyFive.tag = 25
        limitButtonTwentyFive.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        
        stack = UIStackView(arrangedSubviews: [limitButtonFive, limitButtonTen, limitButtonTwentyFive])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        stack.topAnchor.constraint(equalTo: categoryChoicePicker.bottomAnchor, constant: 10).isActive = true
        stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func configureStartButton() {
        view.addSubview(submitButton)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        submitButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 15).isActive = true
        submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
    }
    
    private func takeOffSelectedButton() {
        for item in limitButtonArray {
            item.isChecked = false
        }
    }
    
//    MARK: - Selectors
    
    @objc func handleSubmit() {
        let vc = QuestionViewController(category: categoryChoicePicker.category, limit: limit)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    @objc func handleButton(sender: UIButton) {
        takeOffSelectedButton()
        limit = sender.tag
        switch limit {
        case 10:
            limitButtonTen.isChecked = true
        case 25:
            limitButtonTwentyFive.isChecked = true
        default:
            limitButtonFive.isChecked = true
        }
    }
}

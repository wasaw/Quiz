//
//  FinishTestController.swift
//  Quiz
//
//  Created by Александр Меренков on 3/24/22.
//

import UIKit

class FinishTestController: UIViewController {
    
//    MARK: - Properties
    private let congratulationLabel: UILabel = {
        let label = UILabel()
        label.text = "Поздравляем!"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let newGameButton = Button(title: "Начать заново", background: .systemGreen, font: .white)
    private let recordButton = Button(title: "Записать результат", background: .systemRed, font: .white)
    
    private let result: Result
    
    
//    MARK: - Lifecycle
    
    init(_ result: Result) {
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLabel()
        configureNewGameButton()
        configureRecordButton()
        
        view.backgroundColor = .backgroundColor
    }
    
//    MARK: - Helpers
    
    func configureLabel() {
        view.addSubview(congratulationLabel)
        
        congratulationLabel.translatesAutoresizingMaskIntoConstraints = false
        congratulationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        congratulationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        congratulationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        congratulationLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    func configureNewGameButton() {
        view.addSubview(newGameButton)
        
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        newGameButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        newGameButton.topAnchor.constraint(equalTo: congratulationLabel.bottomAnchor, constant: 30).isActive = true
        newGameButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        newGameButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        newGameButton.addTarget(self, action: #selector(handleNewGame), for: .touchUpInside)
    }
    
    func configureRecordButton() {
        view.addSubview(recordButton)
        
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        recordButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        recordButton.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: 20).isActive = true
        recordButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        recordButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        recordButton.addTarget(self, action: #selector(handleRecordResult), for: .touchUpInside)
    }
    
//    MARK: - Selectors
    
    @objc func handleNewGame() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleRecordResult() {
        let popVC = RecordPopUpController(result)
        popVC.inputViewController?.modalPresentationStyle = .popover
        self.present(popVC, animated: true, completion: nil)
    }
}

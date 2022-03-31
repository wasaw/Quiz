//
//  RecordPopUpController.swift
//  Quiz
//
//  Created by Александр Меренков on 3/29/22.
//

import UIKit

protocol UpdateResultTableDelegate: class {
    func updateResultTable()
}

class RecordPopUpController: UIViewController {
    
//    MARK: - Properties
    
    private let recordPopView = RecordPopView()
    private var result: Result
    private let database = DatabaseService.shared
    
    weak var delegate: UpdateResultTableDelegate?
    
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
        
        configureRecordPopView()
    }
    
//    MARK: - Helpers
    
    func configureRecordPopView() {
        view.addSubview(recordPopView)
        
        recordPopView.translatesAutoresizingMaskIntoConstraints = false
        recordPopView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        recordPopView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        recordPopView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        recordPopView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        recordPopView.allAnswerLabel.text = "Количество ответов: " + String(result.answer)
        recordPopView.percentRightAnswerLabel.text = "Процент правильных ответов: " + String(format: "%.1f", result.percentRightAnswer) + "%"
        
        recordPopView.delegate = self
    }
}

//    MARK: - Extensions

extension RecordPopUpController: SaveResultDelegate {
    func saveResult() {
        guard recordPopView.nicknameTextField.text != "" else { return }
        result.nickname = recordPopView.nicknameTextField.text ?? ""
        database.saveResult(result)
        self.dismiss(animated: true) {
            self.delegate?.updateResultTable()
        }
    }
}

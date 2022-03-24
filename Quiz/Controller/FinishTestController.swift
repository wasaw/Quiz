//
//  FinishTestController.swift
//  Quiz
//
//  Created by Александр Меренков on 3/24/22.
//

import UIKit

class FinishTestController: UIViewController {
    
//    MARK: - Properties
    let congratulationLabel: UILabel = {
        let label = UILabel()
        label.text = "Поздравляем!"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(congratulationLabel)
        
        congratulationLabel.translatesAutoresizingMaskIntoConstraints = false
        congratulationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        congratulationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        congratulationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        congratulationLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        view.backgroundColor = .backgroundColor
    }
}

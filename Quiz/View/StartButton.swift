//
//  StartButton.swift
//  Quiz
//
//  Created by Александр Меренков on 3/22/22.
//

import UIKit

class StartButton: UIButton {
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitle("Начать", for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        setTitleColor(.gray, for: .normal)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

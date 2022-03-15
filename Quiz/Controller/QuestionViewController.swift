//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Александр Меренков on 3/14/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
//    MARK: - Properties
    
    private let reuseIdentifire = "AnswerCell"
    
    let questionForm = QuestionForm()
    var collectionView: UICollectionView?
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCollectionView()
        
        view.backgroundColor = .backgroundColor
    }
    
//    MARK: - Helpers
    
    func configureUI() {
        view.addSubview(questionForm)
        
        questionForm.translatesAutoresizingMaskIntoConstraints = false
        questionForm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        questionForm.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45).isActive = true
        questionForm.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        questionForm.heightAnchor.constraint(equalToConstant: 210).isActive = true
    }
    
    func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(AnswerCell.self, forCellWithReuseIdentifier: reuseIdentifire)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .backgroundColor
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        collectionView.topAnchor.constraint(equalTo: questionForm.bottomAnchor, constant: 70).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
}

//  MARK: - Extensions

extension QuestionViewController: UICollectionViewDelegate {
    
}

extension QuestionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifire, for: indexPath) as? AnswerCell else { return UICollectionViewCell()}
        
        return cell
    }
}

extension QuestionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 90)
    }
}

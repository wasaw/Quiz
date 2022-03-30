//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Александр Меренков on 3/14/22.
//

import UIKit
import Alamofire

class QuestionViewController: UIViewController {
    
//    MARK: - Properties
    
    private let reuseIdentifire = "AnswerCell"
    
    private let questionForm = QuestionForm()
    private var collectionView: UICollectionView?
    private let progressDescription = ProgressViewDescription()
    private let progressView = UIProgressView()
    private var questionsArray = [JsonQuestion]()
    private var numberOfQuestion = 0
    
    private let category: String
    private var limitQuestins: Int
    
    private var result = Result()
    
//    MARK: - Lifecycle
    
    init(category: String, limit: Int) {
        self.category = category
        self.result.topic = category
        self.limitQuestins = limit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
                
        NetworkService.shared.loadQuestion(category: category, limit: String(limitQuestins)) { result in
            self.questionForm.questionTextView.text = result[self.numberOfQuestion].question
            self.questionsArray = result
            if self.questionsArray.count < self.limitQuestins { self.limitQuestins = self.questionsArray.count}
            self.installationProgress()
            self.collectionView?.reloadData()
        }
        
        view.backgroundColor = .backgroundColor
    }
    
//    MARK: - Helpers
        
    func configureUI() {
        configureProgressDescription()
        configureProgressView()
        configureQuestionForm()
        configureCollectionView()
    }
    
    func configureProgressDescription() {
        view.addSubview(progressDescription)
        
        progressDescription.translatesAutoresizingMaskIntoConstraints = false
        progressDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        progressDescription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        progressDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        progressDescription.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    func configureProgressView() {
        view.addSubview(progressView)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        progressView.topAnchor.constraint(equalTo: progressDescription.bottomAnchor, constant: 2).isActive = true
        progressView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        progressView.trackTintColor = .gray
        progressView.tintColor = .white
    }
    
    func configureQuestionForm() {
        view.addSubview(questionForm)
        
        questionForm.translatesAutoresizingMaskIntoConstraints = false
        questionForm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        questionForm.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 10).isActive = true
        questionForm.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        questionForm.heightAnchor.constraint(equalToConstant: 190).isActive = true
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
        collectionView.topAnchor.constraint(equalTo: questionForm.bottomAnchor, constant: 25).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    func animationButton(cell: UICollectionViewCell, color: UIColor) {
        cell.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        cell.backgroundColor = color
        cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        cell.backgroundColor = .answerCellBackground
    }
    
    func installationProgress() {
        let progress = Float(numberOfQuestion) / Float(limitQuestins)
        progressDescription.persentLabel.text = String(format: "%.1f", (progress * 100)) + "%"
        progressDescription.questionLabel.text = String(numberOfQuestion + 1) + "/" + String(limitQuestins)
        progressView.setProgress(progress, animated: true)
        result.answer += 1
    }
    
    func completedTest() {
        result.percentRightAnswer = (Float(limitQuestins) / Float(result.answer)) * 100
        let vc = FinishTestController(result)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
}

//  MARK: - Extensions

extension QuestionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnswerCell else { return }
        if questionsArray[numberOfQuestion].rightAnswer == indexPath.row {
            UIView.animate(withDuration: 0.9) {
                self.animationButton(cell: cell, color: .systemGreen)
            } completion: { _ in
                self.numberOfQuestion += 1
                if self.numberOfQuestion < self.limitQuestins  {
                    self.questionForm.questionTextView.text = self.questionsArray[self.numberOfQuestion].question
                    self.installationProgress()
                    collectionView.reloadData()
                } else {
                    self.completedTest()
                }
            }
        } else {
            UIView.animate(withDuration: 0.9) {
                self.result.answer += 1
                self.animationButton(cell: cell, color: .red)
            }
        }
    }
}

extension QuestionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !questionsArray.isEmpty && numberOfQuestion < questionsArray.count {
            return questionsArray[numberOfQuestion].answerArray.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifire, for: indexPath) as? AnswerCell else { return UICollectionViewCell()}
        if !questionsArray.isEmpty && numberOfQuestion < questionsArray.count {
            cell.textLable.text = questionsArray[numberOfQuestion].answerArray[indexPath.row]
        }
        return cell
    }
}

extension QuestionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 90)
    }
}

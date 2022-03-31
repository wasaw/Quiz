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
    
    private let tableView = UITableView()
    private let reuseIdentifire = "FinishCell"
    
    private let databaseService = DatabaseService.shared
    private var answerResult = [Result]()
    private let limitCellCount = 5
    
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
        configureTableView()
        
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
    
    func configureTableView() {
        tableView.register(FinishCell.self, forCellReuseIdentifier: reuseIdentifire)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        tableView.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 35).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        tableView.isHidden = true
        tableView.backgroundColor = .backgroundColor
    }
    
//    MARK: - Selectors
    
    @objc func handleNewGame() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleRecordResult() {
        if tableView.isHidden {
            let popVC = RecordPopUpController(result)
            popVC.delegate = self
            popVC.inputViewController?.modalPresentationStyle = .popover
            self.present(popVC, animated: true, completion: nil)
        }
    }
}

//  MARK: - Extensions

extension FinishTestController: UITableViewDelegate {
    
}

extension FinishTestController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire, for: indexPath) as? FinishCell else { return UITableViewCell() }
        if !answerResult.isEmpty {
            cell.numberLabel.text = String(indexPath.row + 1)
            cell.nicknameLabel.text = String(answerResult[indexPath.row].nickname)
            cell.topicLabel.text = answerResult[indexPath.row].topic
            cell.percentRightAnswer.text = String(format: "%.1f", answerResult[indexPath.row].percentRightAnswer)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if 0 < answerResult.count && answerResult.count < 5 {
            return answerResult.count
        }
        return 5
    }
}

extension FinishTestController: UpdateResultTableDelegate {
    func updateResultTable() {
        answerResult = databaseService.loadResult()
        tableView.reloadData()
        tableView.isHidden = false
    }
}

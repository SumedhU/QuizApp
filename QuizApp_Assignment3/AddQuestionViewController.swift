//
//  QuestionController.swift
//  QuizApp_Assignment3
//
//  Created by Sumedh Udar on 2024-07-24.
//
import UIKit

protocol SaveQuestionDelegate: AnyObject {
    func didAddQuestion(_ question: Question)
}

class AddQuestionViewController: UIViewController {
    
    weak var delegate: SaveQuestionDelegate?
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var correctOptionTextField: UITextField!
    @IBOutlet weak var option1TextField: UITextField!
    @IBOutlet weak var option2TextField: UITextField!
    @IBOutlet weak var option3TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButtonTapped))
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
    }
    
    @objc func saveButtonTapped() {
        guard let query = questionTextField.text, !query.isEmpty,
              let correctOption = correctOptionTextField.text, !correctOption.isEmpty,
              let option1 = option1TextField.text, !option1.isEmpty,
              let option2 = option2TextField.text, !option2.isEmpty,
              let option3 = option3TextField.text, !option3.isEmpty else {
            showAlert()
            return
        }
        
        let question = Question(query: query, correctOption: correctOption, option2: option1, option3: option2, option4: option3)
        delegate?.didAddQuestion(question)
        navigationController?.popViewController(animated: true)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Please complete all fields.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive))
        present(alert, animated: true)
    }
}

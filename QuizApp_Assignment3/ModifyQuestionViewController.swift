//
//  ModifyQuestionViewController.swift
//  QuizApp_Assignment3
//
//  Created by Sumedh Udar on 2024-07-24.
//
import UIKit

class ModifyQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionInputField: UITextField!
    @IBOutlet weak var correctAnswerInputField: UITextField!
    @IBOutlet weak var wrongAnswer1InputField: UITextField!
    @IBOutlet weak var wrongAnswer2InputField: UITextField!
    @IBOutlet weak var wrongAnswer3InputField: UITextField!
    
    weak var delegate: QuestionHandlerDelegate?
    var currentQuestion: Question?
    var questionIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let question = currentQuestion {
            questionInputField.text = question.query
            correctAnswerInputField.text = question.correctOption
            wrongAnswer1InputField.text = question.option2
            wrongAnswer2InputField.text = question.option3
            wrongAnswer3InputField.text = question.option4
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButtonTapped))
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
    }
    
    @objc private func saveButtonTapped() {
        guard let questionText = questionInputField.text, !questionText.isEmpty,
              let correctAnswer = correctAnswerInputField.text, !correctAnswer.isEmpty,
              let wrongAnswer1 = wrongAnswer1InputField.text, !wrongAnswer1.isEmpty,
              let wrongAnswer2 = wrongAnswer2InputField.text, !wrongAnswer2.isEmpty,
              let wrongAnswer3 = wrongAnswer3InputField.text, !wrongAnswer3.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "Please complete all fields.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive))
            present(alert, animated: true)
            return
        }
        
        let updatedQuestion = Question(
            query: questionText, correctOption: correctAnswer, option2: wrongAnswer1, option3: wrongAnswer2, option4: wrongAnswer3
        )
        
        if let index = questionIndex {
            delegate?.didModifyQuestion(updatedQuestion, at: index)
        }
        
        navigationController?.popViewController(animated: true)
    }
}

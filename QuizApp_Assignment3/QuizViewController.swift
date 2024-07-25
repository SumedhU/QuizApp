//
//  QuizViewController.swift
//  QuizApp_Assignment3
//
//  Created by Sumedh Udar on 2024-07-24.
//
import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet var answerButtons: [UIButton]!
    
    var answerChoices = [String]()
    var currentQuestionIndex = 0
    var totalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        loadNextQuestion()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Quit", style: .plain, target: nil, action: nil)
    }
    
    private func loadNextQuestion() {
        guard currentQuestionIndex < QuestionManager.shared.questionList.count else {
            performSegue(withIdentifier: "showResults", sender: self)
            return
        }
        
        let question = QuestionManager.shared.questionList[currentQuestionIndex]
        questionLabel.text = question.query
        
        answerChoices = [question.option2, question.option3, question.option4, question.correctOption]
        answerChoices.shuffle()
        
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(answerChoices[index], for: .normal)
        }
        
        progressBar.progress = Float(currentQuestionIndex) / Float(QuestionManager.shared.questionList.count)
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        guard let selectedAnswer = sender.titleLabel?.text else { return }
        
        let currentQuestion = QuestionManager.shared.questionList[currentQuestionIndex]
        if selectedAnswer == currentQuestion.correctOption {
            totalScore += 1
        }
        
        currentQuestionIndex += 1
        loadNextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults", let destinationVC = segue.destination as? ResultsViewController {
            destinationVC.currentScore = totalScore
            destinationVC.numberOfQuestions = QuestionManager.shared.questionList.count
        }
    }
}

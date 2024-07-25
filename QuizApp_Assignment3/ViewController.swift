//
//  ViewController.swift
//  QuizApp_Assignment3
//
//  Created by Sumedh Udar on 2024-07-24.
//
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Cancel", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func questionBankButtonTapped(_ sender: UIButton) {
        navigateToQuestionBank()
    }
    
    @IBAction func startQuizButtonTapped(_ sender: UIButton) {
        let questionsAvailable = !QuestionManager.shared.questionList.isEmpty
        if questionsAvailable {
            navigateToQuiz()
        } else {
            presentNoQuestionsAlert()
        }
    }
    
    private func navigateToQuestionBank() {
        performSegue(withIdentifier: "showQuestionBank", sender: self)
    }
    
    private func navigateToQuiz() {
        performSegue(withIdentifier: "showQuiz", sender: self)
    }
    
    private func presentNoQuestionsAlert() {
        let alert = UIAlertController(title: "Oops!", message: "You need to add questions before starting the quiz.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive))
        present(alert, animated: true)
    }
}

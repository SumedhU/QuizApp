//
//  ResultsViewController.swift
//  QuizApp_Assignment3
//
//  Created by Sumedh Udar on 2024-07-24.
//
import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var currentScore: Int = 0
    var numberOfQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        displayScore()
    }
    
    private func configureNavigationBar() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Exit", style: .plain, target: nil, action: nil)
    }
    
    private func displayScore() {
        resultLabel.text = "You scored \((Double(currentScore)/Double(numberOfQuestions))*100)%"
    }
    
    @IBAction func returnToHome(_ sender: UIButton) {
        performSegue(withIdentifier: "showHome", sender: self)
    }
}

//
//  QuestionBankControllerViewController.swift
//  QuizApp_Assignment3
//
//  Created by Sumedh Udar on 2024-07-24.
//
import UIKit

class QuestionBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SaveQuestionDelegate {

    @IBOutlet weak var questionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }
    
    private func setupTableView() {
        questionTableView.delegate = self
        questionTableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addQuestionButtonTapped))
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
    }
    
    @objc private func addQuestionButtonTapped() {
        performSegue(withIdentifier: "addQuestion", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionManager.shared.questionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        cell.textLabel?.text = QuestionManager.shared.questionList[indexPath.row].query
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editQuestion", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addQuestion", let destinationVC = segue.destination as? AddQuestionViewController {
            destinationVC.delegate = self
        } else if segue.identifier == "editQuestion", let destinationVC = segue.destination as? ModifyQuestionViewController, let index = sender as? Int {
            destinationVC.delegate = self
            destinationVC.currentQuestion = QuestionManager.shared.questionList[index]
            destinationVC.questionIndex = index
        }
    }
}

extension QuestionBankViewController: QuestionHandlerDelegate {
    func didAddQuestion(_ question: Question) {
        QuestionManager.shared.add(question)
        questionTableView.reloadData()
    }
    
    func didModifyQuestion(_ question: Question, at index: Int) {
        QuestionManager.shared.questionList[index] = question
        questionTableView.reloadData()
    }
}

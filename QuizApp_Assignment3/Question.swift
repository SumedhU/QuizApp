//
//  Question.swift
//  QuizApp_Assignment3
//
//  Created by Sumedh Udar on 2024-07-24.
//

import Foundation

struct Question {
    var query: String
    var correctOption: String
    var option2: String
    var option3: String
    var option4: String
}

class QuestionManager {
    static let shared = QuestionManager()
    var questionList: [Question] = []

    private init() { }

    func add(_ question: Question) {
        questionList.append(question)
    }

    func update(_ question: Question, with newQuery: String) {
        if let index = questionList.firstIndex(where: { $0.query == question.query }) {
            questionList[index].query = newQuery
        }
    }
}


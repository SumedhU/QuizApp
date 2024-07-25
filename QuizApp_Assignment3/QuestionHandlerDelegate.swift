//
//  QuestionHandlerDelegate.swift
//  QuizApp_Assignment3
//
//  Created by Sumedh Udar on 2024-07-24.
//

import Foundation

protocol QuestionHandlerDelegate: AnyObject {
    func didAddQuestion(_ question: Question)
    func didModifyQuestion(_ question: Question, at index: Int)
}

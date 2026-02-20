//
//  Quiz.swift
//  iQuiz
//
//  Created by Nathanael Simon on 2/17/26.
//

import Foundation
import UIKit

struct Question {
    let text: String
    let answers: [String]
    let correctIndex: Int
}

struct Quiz {
    let title: String
    let description: String
    let iconName: String
    let questions: [Question]
}

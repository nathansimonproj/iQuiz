//
//  Quiz.swift
//  iQuiz
//
//  Created by Nathanael Simon on 2/17/26.
//

import Foundation
import UIKit

struct Quiz: Codable {
    let title: String
    let desc: String
    let questions: [Question]
}

struct Question: Codable {
    let text: String
    let answer: String
    let answers: [String]
}

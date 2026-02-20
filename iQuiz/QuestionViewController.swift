//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Nathanael Simon on 2/20/26.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var submitButton: UIButton!

    var selectedIndex: Int?
    var quiz: Quiz!
    var questionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let question = quiz.questions[questionIndex]
        questionLabel.text = question.text

        for (index, answer) in question.answers.enumerated() {
            answerButtons[index].setTitle(answer, for: .normal)
            answerButtons[index].backgroundColor = .systemGray5
        }
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        // Clear previous selection
        for button in answerButtons {
            button.backgroundColor = .systemGray5
        }
        
        // Highlight selected
        sender.backgroundColor = .systemBlue
        
        selectedIndex = answerButtons.firstIndex(of: sender)
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
        guard selectedIndex != nil else { return }
        
        performSegue(withIdentifier: "showAnswer", sender: nil)
    }

}

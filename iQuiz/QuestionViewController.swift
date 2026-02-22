//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Nathanael Simon on 2/20/26.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    var quiz: Quiz?  // passed from the table
    var currentQuestionIndex = 0
    var selectedAnswerIndex : Int? = nil
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var lastWasCorrect: Bool = false
    var lastCorrectAnswer: String = ""
    var lastQuestionText: String = ""
    
    func loadQuestion() {
        guard let quiz = quiz,
              currentQuestionIndex < quiz.questions.count else { return }
        
        selectedAnswerIndex = nil
        let q = quiz.questions[currentQuestionIndex]
        questionLabel.text = q.text
        answer1Button.setTitle(q.answers[0], for: .normal)
        answer2Button.setTitle(q.answers[1], for: .normal)
        answer3Button.setTitle(q.answers[2], for: .normal)
        
        deselectAll()
        submitButton.isEnabled = false
        
        
    }
    
    
    func deselectAll() {
        for btn in [answer1Button, answer2Button, answer3Button] {
            btn?.backgroundColor = .systemBackground
            btn?.layer.borderWidth = 1
            btn?.layer.borderColor = UIColor.systemBlue.cgColor
            btn?.setTitleColor(.systemBlue, for: .normal)
            btn?.layer.cornerRadius = 8
        }
    }
    
    func selectButton(_ button: UIButton) {
        deselectAll()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
    }
    
    
    @IBAction func answerTapped(_ sender: UIButton) {
        selectButton(sender)
        switch sender {
        case answer1Button: selectedAnswerIndex = 0
        case answer2Button: selectedAnswerIndex = 1
        case answer3Button: selectedAnswerIndex = 2
        default: break
        }
        submitButton.isEnabled = true
    }
    
    @IBAction func submitTapped(_ sender: UIButton) {
        guard let selectedAnswerIndex = selectedAnswerIndex,
              let quiz = quiz else { return }
        
        let q = quiz.questions[currentQuestionIndex]
        lastWasCorrect = selectedAnswerIndex == q.correctIndex
        lastCorrectAnswer = q.answers[q.correctIndex]
        lastQuestionText = q.text
        
        performSegue(withIdentifier: "ShowAnswer", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAnswer",
           let destVC = segue.destination as? AnswerViewController {
            destVC.questionText = lastQuestionText
            destVC.correctAnswer = lastCorrectAnswer
            destVC.wasCorrect = lastWasCorrect
        }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        
    }
    
}

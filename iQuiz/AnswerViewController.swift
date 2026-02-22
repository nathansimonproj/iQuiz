//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Nathanael Simon on 2/22/26.
//

import Foundation
import UIKit

class AnswerViewController : UIViewController {
    
    var questionText: String = ""
    var correctAnswer: String = ""
    var wasCorrect: Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("questionText: \(questionText)")
        print("correctAnswer: \(correctAnswer)")
        print("wasCorrect: \(wasCorrect)")
        
        
        questionLabel.text = questionText
        correctAnswerLabel.text = "Correct Answer: \(correctAnswer)"
        resultLabel.text = wasCorrect ? "✅ Correct!" : "❌ Wrong!"
        resultLabel.textColor = wasCorrect ? .systemGreen : .systemRed
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowResult", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResult",
           let destVC = segue.destination as? ResultViewController {
            destVC.wasCorrect = wasCorrect
        }
    }
    
}

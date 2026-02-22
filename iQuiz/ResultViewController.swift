//
//  ResultViewController.swift
//  iQuiz
//
//  Created by Nathanael Simon on 2/22/26.
//

import Foundation
import UIKit

class ResultViewController : UIViewController {
    var wasCorrect: Bool?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            print("ResultVC loaded, wasCorrect: \(String(describing: wasCorrect))")
            print("resultLabel: \(String(describing: resultLabel))")
            print("scoreLabel: \(String(describing: scoreLabel))")
            
            if let wasCorrect = wasCorrect {
                resultLabel.text = wasCorrect ? "Perfect! ✅" : "Almost! ❌"
                resultLabel.textColor = wasCorrect ? .systemGreen : .systemRed
                scoreLabel.text = wasCorrect ? "1 / 1" : "0 / 1"
            }
    }
    
    
}

//
//  ViewController.swift
//  iQuiz
//
//  Created by Nathanael Simon on 2/17/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    @IBAction func showSettings(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(
            title: "Settings",
            message: "Settings go here",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
    let quizzes: [Quiz] = [
        Quiz(
            title: "Mathematics",
            description: "Test your math knowledge.",
            iconName: "function",
            questions: [
                Question(
                    text: "What is 2 + 2?",
                    answers: ["3", "4", "5"],
                    correctIndex: 1
                ),
                Question(
                    text: "What is 5 * 3?",
                    answers: ["15", "10", "8"],
                    correctIndex: 0
                )
            ]
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuestion" {
            if let questionVC = segue.destination as? QuestionViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                
                questionVC.quiz = quizzes[indexPath.row]
                questionVC.questionIndex = 0
            }
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
        
        let quiz = quizzes[indexPath.row]
        
        cell.textLabel?.text = quiz.title
        cell.detailTextLabel?.text = quiz.description
        cell.imageView?.image = UIImage(systemName: quiz.iconName)
        
        return cell
    }
}




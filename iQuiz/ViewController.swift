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
        ),
        Quiz(
            title: "Marvel Super Heroes",
            description: "Test your marvel knowledge.",
            iconName: "bolt.fill",
            questions: [
                Question(
                    text: "What is Captain America's shield made of?",
                    answers: ["Adamantium", "Vibranium", "Steel"],
                    correctIndex: 1
                ),
                Question(
                    text: "Who is the God of Mischief?",
                    answers: ["Loki", "Thor", "Odin"],
                    correctIndex: 0
                )
            ]
        ),
        Quiz(
            title: "Science",
            description: "Test your science knowledge.",
            iconName: "atom",
            questions: [
                Question(
                    text: "What is the chemical symbol for water?",
                    answers: ["CO2", "O2", "H2O"],
                    correctIndex: 2
                ),
                Question(
                    text: "Which planet is known as the Red Planet?",
                    answers: ["Mars", "Jupiter", "Venus"],
                    correctIndex: 0
                )
            ]
        )
        
        
    ]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowQuiz", sender: quizzes[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowQuiz",
           let destVC = segue.destination as? QuestionViewController,
           let selectedQuiz = sender as? Quiz {
            destVC.quiz = selectedQuiz
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
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




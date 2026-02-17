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
        Quiz(title: "Math", description: "Test your math skills", iconName: "function"),
        Quiz(title: "Marvel Super Heroes", description: "Test your marvel knowledge", iconName: "bolt.fill"),
        Quiz(title: "Science", description: "Test your science knowledge", iconName: "atom")
            
    ]

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


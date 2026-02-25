//
//  ViewController.swift
//  iQuiz
//
//  Created by Nathanael Simon on 2/17/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
//    @IBAction func showSettings(_ sender: UIBarButtonItem) {
//        let alert = UIAlertController(
//            title: "Settings",
//            message: "Settings go here",
//            preferredStyle: .alert
//        )
//        
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        
//        present(alert, animated: true)
//    }
    
    @IBAction func showSettingsTwo(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showSettings", sender: nil)
    }
    
    var quizzes: [Quiz] = []
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let savedData = UserDefaults.standard.data(forKey: "quizData") {
            do {
                quizzes = try JSONDecoder().decode([Quiz].self, from: savedData)
                tableView.reloadData()
            } catch {
                print("Failed to load saved quizzes")
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
        cell.detailTextLabel?.text = quiz.desc
        
        return cell
    }
}




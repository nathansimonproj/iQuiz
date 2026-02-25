//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Nathanael Simon on 2/24/26.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load saved URL or default
        let savedURL = UserDefaults.standard.string(forKey: "quizURL")
        urlTextField.text = savedURL ?? "http://tednewardsandbox.site44.com/questions.json"
    }
    
    @IBAction func checkNowTapped(_ sender: UIButton) {
        
        guard let urlString = urlTextField.text,
              let url = URL(string: urlString) else {
            showAlert(title: "Invalid URL", message: "Please enter a valid URL.")
            return
        }
        
        // Save URL to settings
        UserDefaults.standard.set(urlString, forKey: "quizURL")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Handle network error
            if let error = error {
                DispatchQueue.main.async {
                    self.showAlert(title: "Network Error",
                                   message: error.localizedDescription)
                }
                return
            }
            
            // Make sure data exists
            guard let data = data else {
                DispatchQueue.main.async {
                    self.showAlert(title: "Error",
                                   message: "No data received.")
                }
                return
            }
            
            do {
                // Decode JSON into Quiz objects
                let quizzes = try JSONDecoder().decode([Quiz].self, from: data)
                
                // Save raw JSON so main screen can load it
                UserDefaults.standard.set(data, forKey: "quizData")
                
                DispatchQueue.main.async {
                    self.showAlert(title: "Success",
                                   message: "Downloaded \(quizzes.count) quizzes.")
                }
                
            } catch {
                DispatchQueue.main.async {
                    self.showAlert(title: "JSON Error",
                                   message: "Failed to decode quiz data.")
                }
            }
            
        }.resume()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

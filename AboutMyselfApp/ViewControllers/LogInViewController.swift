//
//  LogInViewController.swift
//  AboutMyselfApp
//
//  Created by Abilkaiyr Nurzhan on 11/10/20.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    let user = User.getUser()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.tag = 1
        logInButton.tag = 2
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func forgotUserNameTapped() {
        showForgotUserNameAlert()
    }
    
    @IBAction func forgotPasswordTapped() {
        showForgotPasswordAlert()
    }
   
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch  textField.tag {
        case userNameTextField.tag:
            textField.returnKeyType = .next
        case passwordTextField.tag:
            textField.returnKeyType = .done
            textField.isSecureTextEntry = true
            textField.enablesReturnKeyAutomatically = true
        default:
            return
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if nextTag == logInButton.tag {
            logInButton.sendActions(for: .touchUpInside)
            return true
        }
        
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
            
        } else {
            textField.resignFirstResponder()
        }
        

        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let entrance = checkForMatching(userName: userNameTextField.text,
                                        with: passwordTextField.text)
        
        if entrance {
            let tabBarController = segue.destination as! TabBarViewController
            tabBarController.user = user
//            let mainVC = tabBarController.viewControllers?[0] as! ViewController
//            let navC = tabBarController.viewControllers?[1] as! UINavigationController
//            let aboutMyselfVC = navC.topViewController as! AboutMyselfViewController
//
//
//            mainVC.user = user
//            aboutMyselfVC.user = user
//
            
            
        } else {
            showInputErrorAlert()
            
        }
        
    }
    
    private func checkForMatching(userName: String?, with password: String?) -> Bool {
        
        if user.userName == userName, user.password == password {
                return true
            
        }
        
        return false
    }
    
    

}

// MARK: - Alert Controller

extension LogInViewController {
    private func showInputErrorAlert() {
        let alert = UIAlertController(title: "Invalid login or password",
                                      message: "Please, enter correct login and password",
                                      preferredStyle:  .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showForgotUserNameAlert() {
        let username = user.userName
        
        let alert = UIAlertController(title: "Oops",
                                      message: "Your name is \(username)",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
    
    private func showForgotPasswordAlert() {
        let password = user.password
        
        let alert = UIAlertController(title: "Oops!",
                                      message: "Your password \(password)",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)

    }
}

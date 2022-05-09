//
//  LoginViewController.swift
//  App_UlanBeishenkulov
//
//  Created by Ulan Beishenkulov on 5/5/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var iconBatman: UIImageView!
    
    @IBOutlet weak var loginView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func tapButtonEnterGotham(_ sender: Any) {
        
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              login == "Ironman",
              password == "WinterSoldierSuck" else {
            showError(message: "Incorrect Login or Password")
            return}
            
            performSegue(withIdentifier: "Login", sender: nil)
    }
}

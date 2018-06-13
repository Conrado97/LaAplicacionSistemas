//
//  ViewController.swift
//  LaAppPC
//
//  Created by CONRADO DELSO GONZALEZ on 12/6/18.
//  Copyright © 2018 CONRADO DELSO GONZALEZ. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var userUid: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToCreateUserVC(){
        performSegue(withIdentifier: "Registrarse", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Registrarse" {
            if let destination = segue.destination as? UserVC {
                if userUid != nil {
                destination.userUid = userUid
            }
                if emailField.text != nil {
                    destination.emailField = emailField.text
                }
                if passwordField.text != nil {
                    destination.passwordField = passwordField.text
                }
            }
    }
}
    @IBAction func SignInTapped(_ sender: Any ){
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion:
                { (user,error) in
                    if error == nil {
                        if let user = user {
                            self.userUid = user.uid
                            self.goToCreateUserVC()
                        }
                    } else {
                        self.goToCreateUserVC()
                    }
            });
        }

}
}

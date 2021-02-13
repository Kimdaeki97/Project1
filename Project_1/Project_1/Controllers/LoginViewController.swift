//
//  LoginViewController.swift
//  Project_1
//
//  Created by 김대기 on 2021/02/13.
//

import Foundation
import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            //signed in
        } else {
            GIDSignIn.sharedInstance()?.signIn()
        }
        */
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    }


}

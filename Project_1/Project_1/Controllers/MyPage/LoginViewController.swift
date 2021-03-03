//
//  LoginViewController.swift
//  Project_1
//
//  Created by 김대기 on 2021/02/13.
//

import Foundation
import UIKit
import GoogleSignIn
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet var IDTextField: UITextField!{
        didSet {
            let grayPlaceholderText = NSAttributedString(string: "EMAIL",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            IDTextField.attributedPlaceholder = grayPlaceholderText
        }
    }
    @IBOutlet var PWTextField: UITextField!{
        didSet {
            let grayPlaceholderText = NSAttributedString(string: "PASSWORD",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            PWTextField.attributedPlaceholder = grayPlaceholderText
        }
    }
    @IBOutlet var LoginButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    @IBOutlet var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        errorLabel.alpha = 0
        setUpElements()
        
        //상단 네비게이션 바 부분을 숨김처리한다.
        self.navigationController?.isNavigationBarHidden = true
        
        /*
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            //signed in
        } else {
            GIDSignIn.sharedInstance()?.signIn()
        }
        */
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    }

    func setUpElements() {
        // 스타일
        Utilities.styleTextField(IDTextField)
        Utilities.styleTextField(PWTextField)
        Utilities.styleFilledButton(LoginButton)
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let ID = IDTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Password = PWTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: ID, password: Password) { (result, error) in
            
            if error != nil {
                
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                
            } else {
                
                let homeViewController =
                    self.storyboard?.instantiateViewController(identifier:
                    Constants.Storyboard.loginViewController) as?
                    LoginViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
                
            }
        }
    }
    
    
}

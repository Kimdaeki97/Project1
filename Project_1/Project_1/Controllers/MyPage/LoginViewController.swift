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
    
    @IBOutlet var IDTextField: UITextField!{
        didSet {
            let grayPlaceholderText = NSAttributedString(string: "ID",
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
    
    @IBOutlet var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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

}

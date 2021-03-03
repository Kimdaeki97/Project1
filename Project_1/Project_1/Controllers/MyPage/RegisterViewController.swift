//
//  RegisterViewController.swift
//  Project_1
//
//  Created by 김대기 on 2021/02/16.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    @IBOutlet var SGIDTextField: UITextField!{
        didSet {
            let grayPlaceholderText = NSAttributedString(string: "EMAIL",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            SGIDTextField.attributedPlaceholder = grayPlaceholderText
        }
    }
    @IBOutlet var SGPWTextField: UITextField!{
        didSet {
            let grayPlaceholderText = NSAttributedString(string: "PASSWORD",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            SGPWTextField.attributedPlaceholder = grayPlaceholderText
        }
    }
    @IBOutlet var SGFirstNameTextField: UITextField!{
        didSet {
            let grayPlaceholderText = NSAttributedString(string: "FIRST NAME",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            SGFirstNameTextField.attributedPlaceholder = grayPlaceholderText
        }
    }
    
    @IBOutlet var SGLastNameTextField: UITextField!{
        didSet {
            let grayPlaceholderText = NSAttributedString(string: "LAST NAME",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            SGLastNameTextField.attributedPlaceholder = grayPlaceholderText
        }
    }
    
    
    @IBOutlet var SGSignInButton: UIButton!
    @IBOutlet var btnForLoginViewController: UIButton!
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.alpha = 0
        setUpElements()
        
        self.navigationController?.isNavigationBarHidden = true
        
    }

    func setUpElements() {
        // 스타일
        Utilities.styleTextField(SGIDTextField)
        Utilities.styleTextField(SGPWTextField)
        Utilities.styleTextField(SGFirstNameTextField)
        Utilities.styleTextField(SGLastNameTextField)
        Utilities.styleFilledButton(SGSignInButton)
    }
    
    func validateFields() -> String? {
        if SGIDTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            SGPWTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            SGFirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            SGLastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
         
            return "빈 칸을 채워주세요."
        }
        
        let cleanedPassword = SGPWTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // 비밀번호가 조건에 안맞은 경우
            return "비밀번호는 최소 8자리 이상으로 특수문자와 숫자가 포함되어야 합니다."
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // 입력한 정보를 허가하기
        let error = validateFields()
        
        if error != nil {
            
            // 입력한 정보에 문제가 있을 때 알려주기
            showError(error!)
        } else {
            
            // Create cleaned versions of the data
            let FirstName = SGFirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let LastName = SGLastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let ID = SGIDTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let Password = SGPWTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // 유저 생성
            Auth.auth().createUser(withEmail: ID, password: Password) { (result, err) in
                
                // 에러 체크
                if err != nil {
                    
                    // 에러가 발생했을 때
                    self.showError("Error creating user")
                } else {
                    
                    // 유저가 성공적으로 생성되었을때, 이름을 저장
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":FirstName,
                                                              "lastname":LastName, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            // 에러 메세지 보여주기
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // 홈화면으로 돌아가기
                    self.TransitionToHome()
                }
            }
            
        }
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func TransitionToHome() {
        
        let loginViewController =
            storyboard?.instantiateViewController(identifier:
            Constants.Storyboard.loginViewController) as?
            LoginViewController
        
        view.window?.rootViewController = loginViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        // 디버깅을 하기 위해 print로 로그를 찍는다.
        print("RegisterViewController - onLoginViewControllerBtnClicked() called / 로그인 버튼 클릭!!")
        
        // 이 함수가 발동 될때 네비게이션 뷰 컨트롤러를 팝 한다.
        // 있을 수 도 있고 없을 수 도 있기 때문에 ?(옵셔널)을 지정
        self.navigationController?.popViewController(animated: true)
    }
    
}

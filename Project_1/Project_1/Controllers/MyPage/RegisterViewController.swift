//
//  RegisterViewController.swift
//  Project_1
//
//  Created by 김대기 on 2021/02/16.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var SGIDTextField: UITextField!{
        didSet {
            let grayPlaceholderText = NSAttributedString(string: "ID",
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
    @IBOutlet var SGNameTextField: UITextField!{
        didSet {
            let grayPlaceholderText = NSAttributedString(string: "NAME",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            SGNameTextField.attributedPlaceholder = grayPlaceholderText
        }
    }
    
    @IBOutlet var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
        
        self.navigationController?.isNavigationBarHidden = true
        
    }

    func setUpElements() {
        // 스타일
        Utilities.styleTextField(SGIDTextField)
        Utilities.styleTextField(SGPWTextField)
        Utilities.styleTextField(SGNameTextField)
    }
    
    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        // 디버깅을 하기 위해 print로 로그를 찍는다.
        print("RegisterViewController - onLoginViewControllerBtnClicked() called / 로그인 버튼 클릭!!")
        
        // 이 함수가 발동 될때 네비게이션 뷰 컨트롤러를 팝 한다.
        // 있을 수 도 있고 없을 수 도 있기 때문에 ?(옵셔널)을 지정
        self.navigationController?.popViewController(animated: true)
    }
    
}

//
//  RegisterViewController.swift
//  Project_1
//
//  Created by 김대기 on 2021/02/16.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
    }

    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        // 디버깅을 하기 위해 print로 로그를 찍는다.
        print("RegisterViewController - onLoginViewControllerBtnClicked() called / 로그인 버튼 클릭!!")
        
        // 이 함수가 발동 될때 네비게이션 뷰 컨트롤러를 팝 한다.
        // 있을 수 도 있고 없을 수 도 있기 때문에 ?(옵셔널)을 지정
        self.navigationController?.popViewController(animated: true)
    }
    
}

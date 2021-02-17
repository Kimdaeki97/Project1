//
//  SettingViewController.swift
//  Project_1
//
//  Created by 김대기 on 2021/02/17.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var btnBackToHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func btnBackToHomeClicked(_ sender: UIButton) {
        print("SettingViewController - btnBackToHomeClicked() called / 뒤로가기 버튼 클릭!!")
        
        self.navigationController?.popToRootViewController(animated: true)
        
        // popViewController(animated: true)
    }
    
}

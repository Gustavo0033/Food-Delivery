//
//  ProfileViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 15/04/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    

    @IBOutlet weak var textFieldRate: UITextField!
    

    @IBOutlet weak var tksFeedback: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    

    @IBAction func btnSubmit(_ sender: UIButton) {
        if let textTyped = textFieldRate.text{
            textFieldRate.text = ""
            tksFeedback.isHidden = false
        }
    }
    
    
    
    

    
}

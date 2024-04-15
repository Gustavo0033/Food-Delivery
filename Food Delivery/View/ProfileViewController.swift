//
//  ProfileViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 15/04/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldRate: UITextField!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = UITextView()
        
        textView.frame = CGRect(x: 20, y: 50, width: 300, height: 200)
        textView.textContainer.maximumNumberOfLines = 5
        textView.textContainer.lineBreakMode = .byTruncatingTail
        
        self.view.addSubview(textView)

        // Do any additional setup after loading the view.
    }
    

}

//
//  LoginViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 22/04/24.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var senhaLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if let emailR = self.emailLabel.text{
            if let senhaR = self.senhaLabel.text{
                
                let autenticado = Auth.auth()
                autenticado.signIn(withEmail: emailR, password: senhaR) { usuario, erro in
                    if erro == nil{
                        if usuario == nil{
                            let alerta = Alerta(titulo: "Erro ao entrar", mensagem: "Crie uma conta")
                            self.present(alerta.getAlert(), animated: true)
                        }else{
                            self.performSegue(withIdentifier: "login", sender: nil)
                        }
                    }else{
                        let alerta02 = Alerta(titulo: "User nao encontrado", mensagem: "Cria a conta cara!")
                        self.present(alerta02.getAlert(), animated: true)
                        
                    }
                }
                
            }
            
        }
    }
    
}

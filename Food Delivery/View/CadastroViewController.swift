//
//  PerfilViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 22/04/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase


class CadastroViewController: UIViewController{
    
    @IBOutlet weak var campoEmail: UITextField!
    @IBOutlet weak var campoNome: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    @IBOutlet weak var campoConfirmSenha: UITextField!
    @IBOutlet weak var campoTelefone: UITextField!
    
    
    
    var firestore: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firestore = Firestore.firestore()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCriarConta(_ sender: UIButton) {
        if let nomeR = self.campoNome.text{
            if let emailR = self.campoEmail.text{
                if let senhaR = self.campoSenha.text{
                    if let confirmarSenhaR = self.campoConfirmSenha.text{
                        if let telefoneR = self.campoTelefone.text{
                            
                            
                            if nomeR != ""{
                                if senhaR == confirmarSenhaR{
                                    
                                    let autenticado = Auth.auth()
                                    autenticado.createUser(withEmail: emailR, password: senhaR) { dadosResultado, erro in
                                        if erro == nil{
                                            if let idUsuario = dadosResultado?.user.uid{
                                                self.firestore.collection("usuarios")
                                                    .document(idUsuario)
                                                    .setData(["Nome": nomeR, "Email": emailR,"Telefone":telefoneR, "id": idUsuario])
                                            }
                                            if dadosResultado == nil{
                                                let alerta = Alerta(titulo: "Erro", mensagem: "Tivemos um erro, apenas teste")
                                                self.present(alerta.getAlert(), animated: true)
                                            }else{
                                                let database = Database.database().reference()
                                                let usuarios = database.child("usuarios")
                                                let usuarioDados = ["Nome": nomeR, "Email": emailR]
                                                
                                                usuarios.child(dadosResultado!.user.uid).setValue(usuarioDados)
                                                
                                                self.performSegue(withIdentifier: "cadastro", sender: nil)
                                            }
                                            
                                        }else{
                                            let contaErro = Alerta(titulo: "Conta já criada", mensagem: "Teste de erro na conta")
                                            self.present(contaErro.getAlert(), animated: true)
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}


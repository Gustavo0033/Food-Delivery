//
//  ValidationViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 24/04/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth



class ValidationViewController: UIViewController, UITextFieldDelegate, NumeroManagerDelegate{

    @IBOutlet weak var labelNumero: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelInvalido: UILabel!
    @IBOutlet weak var btnValidado: UIButton!
    

    var numeroManager = NumeroManager()
    var firestore: Firestore!
    var idUsuario: String!
    var auth: Auth!

 
    
    @IBOutlet weak var textFielNumber: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firestore = Firestore.firestore()
        numeroManager.delegate = self
        textFielNumber.delegate = self
        auth = Auth.auth()
        
        if let id = auth.currentUser?.uid{
            self.idUsuario = id
            
            
        }
        
    }
    
    
    @IBAction func btnValidar(_ sender: Any) {
        textFielNumber.endEditing(true)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let numero = textFielNumber.text{
            numeroManager.buscarNumero(numero: numero)
        }
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textFielNumber.endEditing(true)
    }
    
    
    //MARK: - Retornar os valores e mostra na view & caso tenha sido valido, fecha a view

    func didUpdateNumber(_ numberManager: NumeroManager, number: NumeroModel) {
        DispatchQueue.main.async {
            self.labelNumero.text = number.local
            self.labelCountry.text = number.name
            self.labelLocation.text = number.location
            self.labelInvalido.text = number.valid ? "Valido" : "Invalido"
            
            if number.valid{
                self.navigationController?.popViewController(animated: true)
                let alertaValido = Alerta(titulo: "Número válidado com sucesso!", mensagem: "Seu número foi validado.")
                self.present(alertaValido.getAlert(), animated: true)  
            }else{
                self.labelInvalido.text = "Escreva seu número com região e DDD"
            }
            
            self.labelNumero.isHidden = false
            self.labelCountry.isHidden = false
            self.labelLocation.isHidden = false
           
        }
    }

    //MARK: - Caso tenha algum erro, ele irá imprimir
    func didFailWithError(erro: any Error) {
        print(erro)
    }

}

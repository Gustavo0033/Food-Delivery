//
//  Alerta.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 22/04/24.
//

import UIKit

class Alerta{
    var titulo: String
    var mensagem: String
    init(titulo: String, mensagem: String) {
        self.titulo = titulo
        self.mensagem = mensagem
    }
    
    func getAlert() -> UIAlertController{
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel)
        
        
        alerta.addAction(ok)
        return alerta
    }
}

//
//  NumeroManager.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 24/04/24.
//

import UIKit


protocol NumeroManagerDelegate{
    func didUpdateNumber(_ numberManager:NumeroManager, number: NumeroModel)
    func didFailWithError(erro:Error)

}

struct NumeroManager {
    let apiUrl = "https://phonevalidation.abstractapi.com/v1/?api_key=8937b50d199447799970230c4094f60c"
    
    var delegate: NumeroManagerDelegate?
    
    func buscarNumero(numero: String){
        let urlString = "\(apiUrl)&phone=\(numero)"
        execSolicitacao(with: urlString )
    }
    
    func execSolicitacao(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    if let numero = self.parseJSON(safeData){
                        self.delegate?.didUpdateNumber(self, number: numero)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ numberData: Data) -> NumeroModel?{

        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(NumeroData.self, from:numberData)
            
            let numeroTelefone = decodedData.format.local
            let nameCountry = decodedData.country.name
            let locationCountry = decodedData.location
            let valid = decodedData.valid
            
            let number = NumeroModel(local: numeroTelefone, name: nameCountry, location: locationCountry, valid: valid)
            let numeroValido = validarNumeroTel(numeroTelefone)
            
            if numeroValido{
                print("número válido")
            }else{
                print("Número inválido")
            }
            return number
            
            
        }catch{
            print("numero nao encontrado")
            
            delegate?.didFailWithError(erro: error)
            return nil
        }
    }
    
    func validarNumeroTel(_ numero: String) -> Bool{
        return numero.count >= 10
    }
}

//
//  NumeroData.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 24/04/24.
//

import UIKit

struct NumeroData:Decodable{
    let format: format
    let country: country
    let location: String
    let valid: Bool
    
    struct format: Decodable {
        let local: String
    }
    struct country: Decodable{
        let name: String
    }
}

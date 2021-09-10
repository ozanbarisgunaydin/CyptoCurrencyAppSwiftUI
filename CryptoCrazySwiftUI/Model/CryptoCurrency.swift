//
//  CryptoCurrency.swift
//  CryptoCurrency
//
//  Created by Ozan Barış Günaydın on 9.09.2021.
//

import Foundation
import SwiftUI

struct CryptoCurrency : Hashable, Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String, CodingKey{
        
        case currency = "currency"
        case price = "price"
        
    }
    
}

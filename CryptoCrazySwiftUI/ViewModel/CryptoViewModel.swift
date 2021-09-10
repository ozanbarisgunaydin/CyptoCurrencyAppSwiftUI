//
//  CryptoViewModel.swift
//  CryptoViewModel
//
//  Created by Ozan Barış Günaydın on 9.09.2021.
//

import Foundation

@MainActor

class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = WebService()

    func downloadCryptosAsync(url: URL) async {
        do {
        let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
            DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
        } catch {
            print("Error")
        }
    
    }
}

struct CryptoViewModel {
    
    
    let crypto : CryptoCurrency
    
    var id : UUID? {
        
        crypto.id
        
    }
    
    var currency : String {
        
        crypto.currency
        
    }
    
    var price : String {
        
        crypto.price
        
    }

}


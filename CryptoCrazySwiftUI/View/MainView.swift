//
//  ContentView.swift
//  CryptoCrazySwiftUI
//
//  Created by Ozan Barış Günaydın on 9.09.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListVİewModel : CryptoListViewModel
    
    init() {
        self.cryptoListVİewModel = CryptoListViewModel()
    }
    
    var body: some View {

        NavigationView{
            
            List(cryptoListVİewModel.cryptoList, id: \.id) { crypto in
                
                VStack{
                    
                    Text(crypto.currency).font(.title3).foregroundColor(.cyan).frame(maxWidth: .infinity,  alignment: .leading)
                    Text(crypto.price).foregroundColor(.green).frame(maxWidth: .infinity,  alignment: .leading)
            
                
            }
            }.toolbar(content: {
                
                Button {

                    Task.init {

                        await cryptoListVİewModel.downloadCryptosAsync(url: URL(string: "https://api.nomics.com/v1/prices?key=db5bb9c841b4960458f95f5752c54dce6b352204")!)
                    }
                
                } label: {

                    Text("Refresh")
                    
                }

            })
            .navigationTitle(Text("Crypto Currency"))
            
        }.task { await cryptoListVİewModel.downloadCryptosAsync(url: URL(string: "https://api.nomics.com/v1/prices?key=db5bb9c841b4960458f95f5752c54dce6b352204")!)
      
        }
      }
   
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


//
//  searchBar.swift
//  searchBar
//
//  Created by Ozan Barış Günaydın on 10.09.2021.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
 
    @State private var isEditing = false
 
    var body: some View {
    
               TextField("Search ...", text: $searchText)
                   .padding(7)
                   .padding(.horizontal, 25)
                   .background(Color(.systemGray6))
                   .cornerRadius(8)
                   .padding(.horizontal, 10)
                   .onTapGesture {
                       self.isEditing = true
                   }
    
               if isEditing {
                   Button(action: {
                       self.isEditing = false
                       self.searchText = ""
    
                   }) {
                       Text("Cancel")
                   }
                   .padding(.trailing, 10)
                   .transition(.move(edge: .trailing))
                   .animation(.default)
               }
           }
    }


//
//  GroceryItemView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import SwiftUI
import Models

public struct GroceryItemView: View {
    let groceryItem: GroceryItem
    
    public var body: some View {
        VStack {
            HStack {
                
                Text(groceryItem.name)
                    .font(.headline)
                    .frame(width: .infinity,alignment:.trailing)
                    .padding(.horizontal)
                Spacer()
                Text(" \(groceryItem.price.formatted(.currency(code: "USD")))")
                    .frame(width: .infinity,alignment: .trailing)
                    .font(.headline)
                Spacer()
            }
        }
    }
}

struct GroceryItemView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemView(groceryItem: .tomato)
    }
}

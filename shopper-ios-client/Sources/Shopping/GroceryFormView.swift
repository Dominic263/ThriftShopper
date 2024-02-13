//
//  GroceryFormView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/13/24.
//
import ComposableArchitecture
import Models
import SwiftUI

public struct GroceryFormView: View {
    public let store: StoreOf<GroceryFormFeature>
    
    public init(store: StoreOf<GroceryFormFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            Form {
                TextField("Grocery Item", text: viewStore.$item.name)
                HStack {
                    Text("$")
                    TextField("0.00", value: viewStore.$item.price, formatter: numberFormatter)
                        .keyboardType(.decimalPad)
                }
            }
        }
    }
    
    private let numberFormatter: NumberFormatter = {
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           formatter.maximumFractionDigits = 2 // Set to the maximum number of decimal places you want
           return formatter
       }()
}


struct GroceryFormView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryFormView(store: Store(initialState: GroceryFormFeature.State(item: GroceryItem()),
        reducer: {
            GroceryFormFeature()
        }))
    }
}

//
//  GroceryItemView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import ComposableArchitecture
import SwiftUI
import Models

public struct GroceryItemView: View {
    public let store: StoreOf<GroceryItemFeature>
    
    public init(store: StoreOf<GroceryItemFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            
            VStack {
                HStack {
                    HStack {
                        TextField("Item", text: viewStore.$groceryItem.name)
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.leading)
                    .frame(width: 250.0)
                    
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: "dollarsign.circle")
                            .foregroundColor(.green)
                    }
                    Spacer()
                    
                    HStack {
                        Spacer()
                        TextField("0.00", value: viewStore.$groceryItem.price, format: .currency(code: "US"))
                    }
                    .frame(width: 60.0)
                    .padding(.trailing)
                    
                }
            }
            .frame(height: 50)
        }
    }
}

struct GroceryItemView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemView(store: Store(initialState: GroceryItemFeature.State(), reducer: {
            GroceryItemFeature()
        }))
    }
}

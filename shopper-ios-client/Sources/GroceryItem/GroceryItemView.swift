//
//  GroceryItemView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.

import ComposableArchitecture
import SwiftUI
import Models
import CustomViews

//Displays each Item in a shopping List
public struct GroceryItemView: View {
    public let store: StoreOf<GroceryItemRow>
    
    public init(store: StoreOf<GroceryItemRow>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            
            HStack {
                VStack {
                    TextField("Item", text: viewStore.$groceryItem.name)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Roboto", size: 20))
                    
                    HStack{
                        StepperView(value: viewStore.$groceryItem.quantity)
                            .buttonStyle(BorderedButtonStyle())
                        
                        Text(String(viewStore.groceryItem.quantity))
                            .font(.custom("Roboto", size: 20))
                            
                        Spacer()
                    }
                    
                }
                .padding(.leading, 10.0)
                
                HStack {
                    
                    TextField("0.00", value: viewStore.$groceryItem.price, format: .currency(code: "US"))
                        .font(.custom("Roboto", size: 20))
                        .frame(width: 80)
                        
                    Text(String(format: "%.2f", viewStore.totalCost))
                        .font(.custom("Roboto", size: 20))
                        .frame(width: 80)
                        
                }
                .padding(.trailing)
            }
        }
    }
}

struct GroceryItemView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemView(store: Store(initialState: GroceryItemRow.State(groceryItem: .tomato), reducer: {
            GroceryItemRow()
        }))
    }
}

//
//  ShoppingListView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import ComposableArchitecture
import SwiftUI

public struct ShoppingListView: View {
    let store: StoreOf<ShoppingListFeature>
    public var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            List {
                ForEach(viewStore.shoppingList) { item in
                    GroceryItemView(groceryItem: item)
                }
                .onDelete(perform: { indexSet in
                    viewStore.send(.deleteItems(
                        indexSet: indexSet)
                    )
                })
            }
            .listStyle(PlainListStyle())
            .padding(.vertical, 0)
            
        }
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView(
            store: Store(
                initialState: ShoppingListFeature.State(shoppingList: [.tomato, .meat, .cereal, .toothpaste, .rice]),
                reducer: {
                    ShoppingListFeature()
                }
            )
        )
    }
}

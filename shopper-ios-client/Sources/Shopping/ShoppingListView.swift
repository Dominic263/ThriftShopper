//
//  ShoppingListView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import ComposableArchitecture
import GroceryItem
import SwiftUI

public struct ShoppingListView: View {
    public let store: StoreOf<ShoppingListFeature>
    public init(store: StoreOf<ShoppingListFeature>) {
        self.store = store
    }
    public var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            
            List {
                HStack {
                    Text("ITEM")
                        .padding(.leading)
                        .font(.headline)
                    Spacer()
                    Text("PRICE PER UNIT")
                        .padding(.trailing)
                        .font(.headline)
                }
                
                ForEachStore(self.store.scope(
                    state: \.groceryFeature,
                    action: {.groceryItemsAction(
                        id: $0,
                        action:$1)}),
                             content: { store in
                    GroceryItemView(store: store)
                })
                .onDelete(perform: { indexSet in
                    viewStore.send(.deleteItems(
                        indexSet: indexSet)
                    )
                })
                .listRowSeparator(.hidden)
                
                
                VStack {
                    HStack {
                        Text("TOTAL")
                            .padding(.leading)
                        Spacer()
                        
                        Text(" \(viewStore.total.formatted(.currency(code: "USD")))")
                            .padding(.trailing)
                            .font(.headline)
                    }
                }
                
                
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
                initialState: ShoppingListFeature.State(groceryItemsFeature: .mock),
                reducer: {
                    ShoppingListFeature()
                }
            )
        )
    }
}

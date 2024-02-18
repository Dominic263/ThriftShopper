//
//  ShoppingListView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/16/24.
//
import ComposableArchitecture
import SwiftUI


public struct ShoppingListView: View {
    public let store: StoreOf<ShoppingList>
    
    public init(store: StoreOf<ShoppingList>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            List {
                ForEach(viewStore.shoppingLists) { listDetail in
                   
                    NavigationLink(
                        state: ShoppingRoot.Path.State.detail(ShoppingListDetail.State(title: listDetail.title, groceryItemRows: listDetail.groceryItemRows))
                    ) {
                        SingleListView(title: listDetail.title, date: Date.now)
                    }
                }
                .listStyle(.plain)
                .listRowSeparator(.hidden)
                
            }
        }
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView(
            store: Store(
                initialState: ShoppingList.State(shoppingLists: .lists),
                reducer: {
            ShoppingList()
        }))
    }
}

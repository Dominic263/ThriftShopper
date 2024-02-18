//
//  SwiftUIView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/17/24.
//
import ComposableArchitecture
import SwiftUI

public struct ShoppingRootView: View {
    
    public let store: StoreOf<ShoppingRoot>
    
    public init(store: StoreOf<ShoppingRoot>) {
        self.store = store
    }
    
    public var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: {.path($0)})) {
            ShoppingListView(store: self.store.scope(state: \.shoppingLists, action: {.shoppingLists($0)}))
        } destination: {
            switch $0 {
            case .detail:
                CaseLet(
                    /ShoppingRoot.Path.State.detail,
                     action: ShoppingRoot.Path.Action.detail,
                    then: ShoppingListDetailView.init(store:)
                )
            }
        }

    }
}

struct ShoppingRootView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingRootView(store: Store(initialState: ShoppingRoot.State(shoppingLists: .init(shoppingLists: .lists)), reducer: {
            ShoppingRoot()
        }))
    }
}

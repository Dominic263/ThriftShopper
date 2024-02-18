//
//  ShoppingList.swift
//  
//
//  Created by DOMINIC NDONDO on 2/17/24.
//

import Foundation
import ComposableArchitecture


extension IdentifiedArray where ID == ShoppingListDetail.State.ID, Element == ShoppingListDetail.State {
    public static var lists: Self = [ShoppingListDetail.State(title: "Shop and Shop", groceryItemRows: .init(.stopAndShop))]
}


//Shopping List
public struct ShoppingList: Reducer {
    
    public struct State: Equatable {
        public var shoppingLists: IdentifiedArrayOf<ShoppingListDetail.State>
    }
    
    public enum Action: Equatable {
        case shoppingLists(id: ShoppingListDetail.State.ID, action: ShoppingListDetail.Action)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .shoppingLists:
                return .none
            }
        }
        .forEach(\.shoppingLists, action: /Action.shoppingLists(id:action:)){
            ShoppingListDetail()
        }
    }
}




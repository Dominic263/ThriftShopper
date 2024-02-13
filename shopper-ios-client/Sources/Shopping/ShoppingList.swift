//
//  ShoppingListFeature.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import ComposableArchitecture
import Models
import Foundation

public struct ShoppingListFeature: Reducer {
    public struct State: Equatable {
        public var shoppingList: IdentifiedArrayOf<GroceryItem>
    }
    
    public init() {}
    
    public enum Action: Equatable {
        case deleteItems(indexSet: IndexSet)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .deleteItems(indexSet: let indexSet):
                state.shoppingList.remove(atOffsets: indexSet)
                return .none
            }
        }
    }
}

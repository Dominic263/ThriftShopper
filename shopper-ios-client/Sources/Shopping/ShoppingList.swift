//
//  ShoppingListFeature.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import ComposableArchitecture
import Models
import Foundation
import GroceryItem

extension IdentifiedArray where ID == GroceryItemFeature.State.ID, Element == GroceryItemFeature.State {
    public static let mock: Self = [
        GroceryItemFeature.State.init(groceryItem: GroceryItem(id: GroceryItem.ID(), name: "Romain Lettuce", price: 3.45)),
        GroceryItemFeature.State.init(groceryItem: GroceryItem(id: GroceryItem.ID(), name: "Beef Teriyaki", price: 13.50)),
        GroceryItemFeature.State.init(groceryItem: GroceryItem(id: GroceryItem.ID(), name: "Toothpaste ", price: 2.75)),
        GroceryItemFeature.State.init(groceryItem: GroceryItem(id: GroceryItem.ID(), name: "Coffee Table", price: 50.99))
    ]
}

public struct ShoppingListFeature: Reducer {
    public struct State: Equatable {
        
        public var groceryFeature: IdentifiedArrayOf<GroceryItemFeature.State>
        
        public var total: Double {
            return self.groceryFeature.map {
                $0.groceryItem.price
            }.reduce(0, +)
        }
        
        public init(groceryItemsFeature: IdentifiedArrayOf<GroceryItemFeature.State>) {
            self.groceryFeature = groceryItemsFeature
        }
    }
    
    public init() {}
    
    
    public enum Action: Equatable {
        case deleteItems(indexSet: IndexSet)
        
        case groceryItemsAction(id: GroceryItemFeature.State.ID, action: GroceryItemFeature.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .deleteItems(indexSet: let indexSet):
                state.groceryFeature.remove(atOffsets: indexSet)
                return .none
            case .groceryItemsAction(id: _, action: _):
                return .none
            }
        }
        .forEach(\.groceryFeature, action: /Action.groceryItemsAction) {
            GroceryItemFeature()
        }
    }
}

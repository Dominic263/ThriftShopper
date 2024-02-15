//
//  GroceryItemRow.swift
//  
//
//  Created by DOMINIC NDONDO on 2/13/24.
//

import Foundation
import Models
import Tagged
import ComposableArchitecture

//Powers the display of each row in the shopping list
public struct GroceryItemRow: Reducer {
    public struct State: Equatable, Identifiable, Codable {
        @BindingState public var groceryItem: GroceryItem
        
        //Computed Property gives us the final
        public var totalCost: Double {
            groceryItem.price * Double(groceryItem.quantity)
        }
        
        public var id: Tagged<GroceryItem, UUID>
        public init(groceryItem: GroceryItem) {
            self.groceryItem = groceryItem
            self.id = groceryItem.id
        }
    }
    
    public enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            }
        }
    }
}

//
//  GroceryForm.swift
//  
//
//  Created by DOMINIC NDONDO on 2/13/24.
//
import ComposableArchitecture
import Models
import Foundation

public struct GroceryForm: Reducer {
    public struct State: Equatable {
        @BindingState public var item: GroceryItem
        
        public init(
            item: GroceryItem = .init(id: GroceryItem.ID(), name: "", price: 0, quantity: 0)
        ) {
            self.item = item
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

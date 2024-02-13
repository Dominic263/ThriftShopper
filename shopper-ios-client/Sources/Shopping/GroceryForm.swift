//
//  GroceryForm.swift
//  
//
//  Created by DOMINIC NDONDO on 2/13/24.
//
import ComposableArchitecture
import Models
import Foundation

public struct GroceryFormFeature: Reducer {
    public struct State: Equatable {
        @BindingState public var item: GroceryItem
    }
    
    public enum Action: BindableAction {
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

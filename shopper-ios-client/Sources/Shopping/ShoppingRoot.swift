//
//  ShoppingRoot.swift
//  
//
//  Created by DOMINIC NDONDO on 2/16/24.
//
import ComposableArchitecture
import Foundation


public struct ShoppingRoot: Reducer {
    public init() { }
    
    public struct State: Equatable {
        public var path = StackState<Path.State>()
        public var shoppingLists = ShoppingList.State(shoppingLists: .lists)
    }
    
    public enum Action: Equatable {
        case path(StackAction<Path.State, Path.Action>)
        case shoppingLists(ShoppingList.Action)
    }
    
    public var body: some ReducerOf<Self> {
        
        Scope(state: \.shoppingLists, action: /Action.shoppingLists) {
            ShoppingList()
        }
        
        Reduce { state, action in
            switch action {
            case .shoppingLists:
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: /Action.path){
            Path()
        }
    }
    
    
    //Path Reducer
    public struct Path: Reducer {
        public enum State: Equatable {
            case detail(ShoppingListDetail.State)
        }
        
        public init() {}
        
        public enum Action: Equatable {
            case detail(ShoppingListDetail.Action)
        }
        
        public var body: some ReducerOf<Self> {
            Scope(state: /State.detail, action: /Action.detail) {
                ShoppingListDetail()
            }
        }
    }
    
}

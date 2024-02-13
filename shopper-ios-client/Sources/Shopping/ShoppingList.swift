//
//  File.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import ComposableArchitecture
import Foundation

public struct ShoppingList: Reducer {
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        case none
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .none:
                return .none
            }
        }
    }
}

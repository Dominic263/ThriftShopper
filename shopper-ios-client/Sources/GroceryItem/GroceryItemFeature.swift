//
//  File.swift
//  
//
//  Created by DOMINIC NDONDO on 2/13/24.
//

import Foundation
import Models
import Tagged
import ComposableArchitecture

public struct GroceryItemFeature: Reducer {
    public struct State: Equatable, Identifiable, Codable {
        @BindingState public var groceryItem: GroceryItem
        public var id: Tagged<Self, UUID>
        public init(groceryItem: GroceryItem = .init(name: "Beef Teriyaki", price: 19.99)) {
            self.groceryItem = groceryItem
            @Dependency(\.uuid) var uuid
            self.id = .init(uuid())
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

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

extension IdentifiedArray where ID == GroceryItem.ID, Element == GroceryItemRow.State {
    public static var mock: Self = [
        GroceryItemRow.State.init(groceryItem: GroceryItem(id: GroceryItem.ID(), name: "Romain Lettuce", price: 3.45, quantity: 2)),
        GroceryItemRow.State.init(groceryItem: GroceryItem(id: GroceryItem.ID(), name: "Beef Teriyaki", price: 13.50, quantity: 4)),
        GroceryItemRow.State.init(groceryItem: GroceryItem(id: GroceryItem.ID(), name: "Toothpaste ", price: 2.75, quantity: 3)),
        GroceryItemRow.State.init(groceryItem: GroceryItem(id: GroceryItem.ID(), name: "Coffee Table", price: 50.99, quantity: 5))
    ]
}

public struct ShoppingListFeature: Reducer {
    public struct State: Equatable {
        
        public var groceryItemRows: IdentifiedArrayOf<GroceryItemRow.State>
        @PresentationState public var destination: Destination.State? = nil
        
        public var total: Double {
            return self.groceryItemRows.map {
                $0.totalCost
            }.reduce(0, +)
        }
        
        public init(groceryItemRows: IdentifiedArrayOf<GroceryItemRow.State>) {
            self.groceryItemRows = groceryItemRows
        }
    }
    
    public init() {}
    
    public struct Destination: Reducer {
        public enum State: Equatable {
            case addNewItem(GroceryForm.State)
        }
        
        public init() {}
        
        public enum Action: Equatable {
            case addNewItem(GroceryForm.Action)
        }
        
        public var body: some ReducerOf<Self>{
            Scope(state: /State.addNewItem, action: /Action.addNewItem) {
                GroceryForm()
            }
        }
    }
    
    public enum Action: Equatable {
        case deleteItems(indexSet: IndexSet)
        case addItemButtomTapped
        case confirmAddItem
        case confirmCancelAddItem
        case destination(PresentationAction<Destination.Action>)
        case groceryItemsAction(id: GroceryItemRow.State.ID, action: GroceryItemRow.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .confirmCancelAddItem:
                state.destination = nil
                return .none
            case .destination:
                return .none
            case .confirmAddItem:
                guard case let .some(.addNewItem(formState)) = state.destination else {
                    return .none
                }
                
                let newItem = formState.item
                state.groceryItemRows.append(.init(groceryItem: newItem))
                state.destination = nil
                
                return .none
            case .addItemButtomTapped:
                state.destination = Destination.State.addNewItem(.init())
                return .none
            case .deleteItems(indexSet: let indexSet):
                state.groceryItemRows.remove(atOffsets: indexSet)
                return .none
            case .groceryItemsAction:
                return .none
            }
        }
        .ifLet(\.$destination, action: /Action.destination) {
            Destination()
        }
        .forEach(\.groceryItemRows, action: /Action.groceryItemsAction(id:action:)) {
            GroceryItemRow()
        }
    }
}

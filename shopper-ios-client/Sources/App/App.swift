//
//  AppFeature.swift
//  
//
//  Created by DOMINIC NDONDO on 2/8/24.

import Foundation
import ComposableArchitecture
import Shopping
import Settings
import Calendar
import Models
import GroceryItem

public enum Tab {
    case shopping
    case calendar
    case settings
}

public struct AppFeature: Reducer {
    public struct State: Equatable {
        @BindingState public var selectedTab: Tab
        public var shoppingFeature: ShoppingListFeature.State
        public var calendar: CalendarFeature.State = .init()
        public var settings: SettingsFeature.State = .init()
        @PresentationState var destination: Destination.State? = nil
        
        public init(selectedTab: Tab = .shopping, shoppingFeature: ShoppingListFeature.State) {
            self.selectedTab = selectedTab
            self.shoppingFeature = shoppingFeature
        }
    }
    
    public init() {}
    
    public enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        case changeSelectedTab(Tab)
        case shopping(ShoppingListFeature.Action)
        case calendar(CalendarFeature.Action)
        case settings(SettingsFeature.Action)
        case destination(PresentationAction<Destination.Action>)
        case plusButtonTapped
        case addItemButtonTapped
    }
    
    //Destination Reducer to control Modals
    public struct Destination: Reducer {
        public enum State: Equatable {
            case add(GroceryFormFeature.State)
        }
        
        public enum Action: Equatable {
            case add(GroceryFormFeature.Action)
        }
        
        public init() {}
        
        public var body: some ReducerOf<Self> {
            Scope(state: /State.add, action: /Action.add) {
                GroceryFormFeature()
            }
        }
    }
 
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .addItemButtonTapped:
                //TODO: implement the add button method
                return .none
            case .plusButtonTapped:
                state.destination = .add(GroceryFormFeature.State(item: .init(id: GroceryItem.ID(), name: "", price: 0.00)))
                return .none
            case .shopping:
                return .none
            case .binding:
                return .none
            case .changeSelectedTab(let tab):
                state.selectedTab = tab
                return .none
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: /Action.destination){
            Destination()
        }
        
        Scope(state: \.shoppingFeature, action: /Action.shopping) {
            ShoppingListFeature()
        }
        Scope(state: \.calendar, action: /Action.calendar) {
            CalendarFeature()
        }
        Scope(state: \.settings, action: /Action.settings) {
            SettingsFeature()
        }
    }
}

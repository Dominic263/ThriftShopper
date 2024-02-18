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
        //public var shoppingFeature: ShoppingListDetail.State
        public var calendar: CalendarFeature.State = .init()
        public var settings: SettingsFeature.State = .init()
        
        public init(selectedTab: Tab = .shopping) {
            self.selectedTab = selectedTab
            //self.shoppingFeature = shoppingFeature
        }
    }
    
    public init() {}
    
    public enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        case changeSelectedTab(Tab)
        //case shopping(ShoppingListDetail.Action)
        case calendar(CalendarFeature.Action)
        case settings(SettingsFeature.Action)
    }
    
 
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {

           // case .shopping:
           //     return .none
            case .binding:
                return .none
            case .changeSelectedTab(let tab):
                state.selectedTab = tab
                return .none
            }
        }
        /*
        Scope(state: \.shoppingFeature, action: /Action.shopping) {
            ShoppingListDetail()
        }
         
         */
        Scope(state: \.calendar, action: /Action.calendar) {
            CalendarFeature()
        }
        Scope(state: \.settings, action: /Action.settings) {
            SettingsFeature()
        }
    }
}

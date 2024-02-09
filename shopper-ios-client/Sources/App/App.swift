//
//  File.swift
//  
//
//  Created by DOMINIC NDONDO on 2/8/24.
//

import Foundation
import ComposableArchitecture

public enum Tab {
    case shopping
    case calendar
    case settings
}

public struct AppFeature: Reducer {
    public struct State: Equatable {
        @BindingState public var selectedTab: Tab
        init(selectedTab: Tab = .shopping) {
            self.selectedTab = selectedTab
        }
    }
    
    public enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        case changeSelectedTab(Tab)
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .changeSelectedTab(let tab):
                state.selectedTab = tab
                return .none
            }
        }
    }
}

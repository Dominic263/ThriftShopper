//
//  AppView.swift
//
//  Created by DOMINIC NDONDO on 2/8/24.
import ComposableArchitecture
import Shopping
import Calendar
import Settings
import SwiftUI

public struct AppView: View {
    public let store: StoreOf<AppFeature>
    
    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView(selection: viewStore.$selectedTab) {
                
                /*
                ShoppingListView(
                    store: self.store.scope(
                        state: \.shoppingFeature,
                        action: { .shopping($0) }
                    )
                )
                .tabItem {
                    Image(systemName: "cart")
                }
                .tag(Tab.shopping)
                */
                
                CalendarView(
                    store: self.store.scope(
                        state: \.calendar,
                        action: { .calendar($0)}
                    )
                )
                .tabItem {
                    Image(systemName: "calendar")
                }
                .tag(Tab.calendar)
                
                
                SettingsView(store: self.store.scope(state: \.settings, action: {.settings($0)}))
                    .tabItem {
                        Image(systemName: "gear")
                    }
                    .tag(Tab.settings)
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(
            store: Store(initialState: AppFeature.State(), reducer: {
                AppFeature()
            }
            )
        )
    }
}

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
                
                NavigationStack {
                    ShoppingListView(
                        store: self.store.scope(
                            state: \.shoppingFeature,
                            action: { .shopping($0) }
                        )
                    )
                    .sheet(
                        store: self.store.scope(
                            state: \.$destination,
                            action: { .destination($0) }
                        ),
                        state: /AppFeature.Destination.State.add, action: AppFeature.Destination.Action.add, content: { store in
                            NavigationStack {
                                GroceryFormView(store: store)
                                    .toolbar {
                                        ToolbarItem(placement: .navigationBarLeading) {
                                            Button(action: {}){
                                                Text("Cancel")
                                            }
                                        }
                                        
                                        ToolbarItem(placement: .navigationBarTrailing) {
                                            Button(action: {}){
                                                Text("Add")
                                            }
                                        }
                                    }
                                    .navigationBarTitle("Add Item")
                            }
                    })
                    .navigationTitle("Shopping List")
                    .toolbar {
                        ToolbarItem {
                            Button(
                                action: { viewStore.send(.plusButtonTapped)}) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
                .tabItem {
                    Image(systemName: "cart")
                }
                .tag(Tab.shopping)
                
                NavigationStack {
                    CalendarView(
                        store: self.store.scope(
                            state: \.calendar,
                            action: { .calendar($0)}
                        )
                    )
                    .navigationTitle("Calendar")
                    
                }
                .tabItem {
                    Image(systemName: "calendar")
                }
                .tag(Tab.calendar)
                
                NavigationStack {
                    SettingsView(store: self.store.scope(state: \.settings, action: {.settings($0)}))
                        .navigationTitle("Settings")
                }
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
            store: Store(
                initialState: AppFeature.State( shoppingFeature: .init(groceryItemsFeature: .mock)),
                reducer: {
                    AppFeature()
                }
            )
        )
    }
}

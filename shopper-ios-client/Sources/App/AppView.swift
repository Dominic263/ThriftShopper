//
//  SwiftUIView.swift
//
//  Created by DOMINIC NDONDO on 2/8/24.
import ComposableArchitecture
import SwiftUI

public struct AppView: View {
    public let store: StoreOf<AppFeature>
    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            TabView(selection: viewStore.$selectedTab) {
                //TODO: Implement screens for the shopping screen, calendar screen and settings screens.
                Text("Shopping")
                    .tabItem {
                        Image(systemName: "cart")
                    }
                    .tag(Tab.shopping)
                
                Text("Calendar")
                    .tabItem {
                        Image(systemName: "calendar")
                    }
                    .tag(Tab.calendar)
                
                Text("Settings")
                    .tabItem {
                        Image(systemName: "gear")
                    }
                    .tag(Tab.shopping)
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(
            store: Store(
                initialState: AppFeature.State(),
                reducer: {
                    AppFeature()
                }
            )
        )
    }
}

//
//  SettingsView.swift
//
//
//  Created by DOMINIC NDONDO on 2/13/24.
//
import ComposableArchitecture
import SwiftUI

public struct CalendarView: View {
    public let store: StoreOf<CalendarFeature>
    
    public init(store: StoreOf<CalendarFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text("Calendar View")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(store: Store(initialState: CalendarFeature.State(), reducer: {
            CalendarFeature()
        }))
    }
}

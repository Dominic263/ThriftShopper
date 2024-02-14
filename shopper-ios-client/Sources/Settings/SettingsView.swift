//
//  SettingsView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/13/24.
//
import ComposableArchitecture
import SwiftUI

public struct SettingsView: View {
    public let store: StoreOf<SettingsFeature>
    
    public init(store: StoreOf<SettingsFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text("Settings View")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(store: Store(initialState: SettingsFeature.State(), reducer: {
            SettingsFeature()
        }))
    }
}

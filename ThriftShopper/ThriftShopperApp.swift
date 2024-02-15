//
//  ThriftShopperApp.swift
//  ThriftShopper
//
//  Created by DOMINIC NDONDO on 2/8/24.
//

import SwiftUI
import ComposableArchitecture
import App

@main
struct ShopperApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
                store: Store(
                    initialState: AppFeature.State(shoppingFeature: .init(groceryItemRows: .mock)),
                    reducer: {
                        AppFeature()
                    }
                )
            )
        }
    }
}

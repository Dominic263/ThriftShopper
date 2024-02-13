//
//  GroceryFormView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/13/24.
//
import ComposableArchitecture
import SwiftUI

public struct GroceryFormView: View {
    let store: StoreOf<GroceryFormFeature>
    public var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            Form {
                TextField("Grocery Item", text: viewStore.$item.name)
                TextField("Price", text: viewStore.$item.price.value)
            }
        }
    }
}

#warning("need better implementation of price in TextField")
extension Double {
    fileprivate var value: String {
        get { String(self) }
        set { self = Double(newValue) ?? 0.00}
    }
}

struct GroceryFormView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryFormView(store: Store(initialState: GroceryFormFeature.State(item: .tomato),
        reducer: {
            GroceryFormFeature()
        }))
    }
}

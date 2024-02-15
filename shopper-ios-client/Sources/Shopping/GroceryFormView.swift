//
//  GroceryFormView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/13/24.
//
import ComposableArchitecture
import Models
import SwiftUI
import CustomViews

public struct GroceryFormView: View {
    public let store: StoreOf<GroceryForm>
    
    public init(store: StoreOf<GroceryForm>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            Form {
                TextField("Grocery Item", text: viewStore.$item.name)
                HStack {
                    Text("$")
                    TextField("0.00", value: viewStore.$item.price, formatter: numberFormatter)
                        .keyboardType(.decimalPad)
                }
                
                HStack {
                    GeometryReader { geo in
                        HStack{
                            HStack {
                                Text("Quantity")
                                Spacer()
                            }
                            .frame(width: geo.size.width/2)
                            PickerView(selection: viewStore.$item.quantity)
                                .frame(width: geo.size.width/2)
                        }
                    }
                }
                .frame(height: 100)
            }
        }
    }
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}


struct GroceryFormView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryFormView(
            store: Store(
                initialState: GroceryForm.State(
                    item: .meat
                ),
                reducer: {
                    GroceryForm()
                }
            )
        )
    }
}

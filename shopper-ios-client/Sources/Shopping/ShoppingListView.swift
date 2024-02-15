//
//  ShoppingListView.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import ComposableArchitecture
import GroceryItem
import SwiftUI

public struct ShoppingListView: View {
    
    public let store: StoreOf<ShoppingListFeature>
    
    public init(store: StoreOf<ShoppingListFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack {
                List {
                    ListHeadingView()
                    ForEachStore(self.store.scope(
                        state: \.groceryItemRows,
                        action: ShoppingListFeature.Action.groceryItemsAction(id:action:)),
                                 content: {
                        GroceryItemView(store: $0)
                            .frame(height: 50)
                    })
                    .onDelete(perform: { indexSet in
                        viewStore.send(.deleteItems(
                            indexSet: indexSet)
                        )
                    })
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    VStack {
                        HStack {
                            Text("TOTAL")
                                .font(.custom("Roboto", size: 20))
                                .padding(.leading)
                            Spacer()
                            
                            Text("\(viewStore.total.formatted(.currency(code: "USD")))")
                                .font(.custom("Roboto", size: 20))
                                .padding(.trailing)
                                
                        }
                    }
                    //TotalView(total: viewStore.$total)
                }
                .sheet(store: self.store.scope(state: \.$destination, action: { .destination($0) }), state: /ShoppingListFeature.Destination.State.addNewItem, action: ShoppingListFeature.Destination.Action.addNewItem, content: { store in
                    NavigationStack {
                        GroceryFormView(store: store)
                            .navigationTitle("Add New Item")
                            .toolbar {
                                ToolbarItem {
                                    Button(action: {viewStore.send(.confirmAddItem)}){
                                        Text("Add")
                                    }
                                }
                                
                                ToolbarItem {
                                    Button(action: {viewStore.send(.confirmCancelAddItem)}){
                                        Text("Cancel")
                                    }
                                }
                            }
                    }
                })
                .listStyle(PlainListStyle())
                .navigationTitle("Shopping List")
                .toolbar {
                    ToolbarItem {
                        Button(
                            action: { viewStore.send(.addItemButtomTapped)}
                        ) {
                            Text("Add Item")
                                .foregroundColor(.mint)
                        }
                    }
                }
            }
        }
    }
}



struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView(
            store: Store(
                initialState: ShoppingListFeature.State(
                    groceryItemRows: .mock
                ),
                reducer: {
                    ShoppingListFeature()
                }
            )
        )
    }
}

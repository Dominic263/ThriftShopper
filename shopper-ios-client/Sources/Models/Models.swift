//
//  Models.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import ComposableArchitecture
import Tagged
import Foundation

public struct Shopper: Equatable, Identifiable, Codable {
    public let id: Tagged<Self, UUID>
    public var firstName: String
    public var lastName: String
    public let dateJoined: Date
    public var groceryLst: IdentifiedArrayOf<GroceryItem>
}

public struct GroceryItem: Equatable, Identifiable, Codable {
    public let id: Tagged<Self, UUID>
    public var name: String
    public var price: Double
}

extension GroceryItem {
    public static let meat = GroceryItem(id: GroceryItem.ID(), name: "Teriyaki Beef", price: 11.99)
    public static let rice = GroceryItem(id: GroceryItem.ID(), name: "Basmati Rice", price: 5.70)
    public static let cereal = GroceryItem(id: GroceryItem.ID(), name: "Cornflakes", price: 3.50)
    public static let lettuce = GroceryItem(id: GroceryItem.ID(), name: "Romain Lettuce", price: 2.30)
    public static let tomato = GroceryItem(id: GroceryItem.ID(), name: "Cherry Tomato", price: 5.70)
    public static let toothpaste = GroceryItem(id: GroceryItem.ID(), name: "Colgate", price: 2.00)
    
}

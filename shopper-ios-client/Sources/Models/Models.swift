//
//  Models.swift
//  
//
//  Created by DOMINIC NDONDO on 2/12/24.
//
import ComposableArchitecture
import Tagged
import Foundation

struct Shopper: Equatable, Identifiable, Codable {
    let id: Tagged<Self, UUID>
    var firstName: String
    var lastName: String
    let dateJoined: Date
    var groceryLst: IdentifiedArrayOf<GroceryItem>
}

struct GroceryItem: Equatable, Identifiable, Codable {
    let id: Tagged<Self, UUID>
    var name: String
    var price: Double
}

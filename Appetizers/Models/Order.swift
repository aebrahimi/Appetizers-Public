//
//  Order.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 6/2/21.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var orderItems: [OrderItem] = []
    
    var orderTotal: Double {
        orderItems.reduce(0){ $0 + (Double($1.quantity) * $1.appetizer.price) }
    }
    
    func add(_ quantity: Int, of appetizer: Appetizer) {
        
        //Determine if the there are any order items for the same appetizer already in the order.
        if let firstIndex = orderItems.firstIndex(where: { $0.appetizer == appetizer }) {
            
            //Get the existing quantity.
            let existingQuantity = orderItems[firstIndex].quantity
            
            //Build the new quantity.
            let newQuantity = existingQuantity + quantity
            
            //Remove the existing order item.
            orderItems.remove(at: firstIndex)
            
            //Insert the new order item.
            orderItems.insert(OrderItem(appetizer: appetizer, quantity: newQuantity), at: firstIndex)
        } else {
            //There were no matches, proceed with the insert.
            orderItems.append(OrderItem(appetizer: appetizer, quantity: quantity))
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

struct OrderItem: Identifiable {
    
    let id = UUID()
    let appetizer: Appetizer
    let quantity: Int
}

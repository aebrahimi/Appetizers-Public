//
//  OrderView.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 5/31/21.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.orderItems) { orderItem in
                            AppetizerListViewCell(orderItem: orderItem)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())

                    Button {
                        
                    } label: {
                        APButton(title: "$\(order.orderTotal, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 25)
                }
                
                if(order.orderItems.isEmpty) {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\n\nPlease add an appetizer.")
                }
            }
            .navigationTitle("🧾 Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

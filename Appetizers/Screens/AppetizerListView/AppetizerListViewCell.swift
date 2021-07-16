//
//  AppetizerListViewCell.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 5/31/21.
//

import SwiftUI

struct AppetizerListViewCell: View {
        
    let appetizer: Appetizer
    let orderItem: OrderItem?
    
    init(appetizer: Appetizer){
        self.appetizer = appetizer
        self.orderItem = nil
    }
    
    init(orderItem: OrderItem)
    {
        self.appetizer = orderItem.appetizer
        self.orderItem = orderItem
    }
    
    var body: some View {
        HStack {
            if let orderItem = orderItem {
                VStack {
                    Text("\(orderItem.quantity) x ")
                    
                    //TODO: Find a Stepper init method that allows for the range and then responds to the tap to increase / decrease the quantity.
                    Stepper(
                        onIncrement: {
                            print("Increase Quantity")
                        },
                        onDecrement: {
                            print("Decrease Quantity")
                        },
                        label: {
                            Text("")
                        })
                }
            }
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .minimumScaleFactor(0.5)

                Text("$ \(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListViewCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListViewCell(appetizer: MockData.sampleAppetizer)
            .preferredColorScheme(.dark)
    }
}

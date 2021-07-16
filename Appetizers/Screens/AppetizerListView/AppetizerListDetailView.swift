//
//  AppetizerListDetailView.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 6/1/21.
//

import SwiftUI

struct AppetizerListDetailView: View {
    
    @EnvironmentObject var order: Order
    
    @State var quantity = 1.0
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                NutritionInfoView(appetizer: appetizer)
                
                Stepper("Quantity: \(quantity, specifier: "%.f")", value: $quantity)
                    .padding()
            }
            
            Spacer()
            
            Button {
                order.add(Int(quantity), of: appetizer)
                isShowingDetail = false
            } label: {
                let itemTotal = appetizer.price * quantity
                APButton(title: "$\(itemTotal, specifier: "%.2f") - Add To Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 500)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct AppetizerListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListDetailView(appetizer: MockData.sampleAppetizer,
                                isShowingDetail: .constant(false))
            .preferredColorScheme(.light)
            
    }
}

struct NutritionInfoView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 40) {
            NutritionInfoViewItem(title: "Calories",
                                  value: String(appetizer.calories))
            
            NutritionInfoViewItem(title: "Carbs",
                                  value: "\(appetizer.carbs) g")
            
            NutritionInfoViewItem(title: "Protein",
                                  value: "\(appetizer.protein) g")
        }
    }
}

struct NutritionInfoViewItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .bold()
            
            Text("\(value)")
                .fontWeight(.semibold)
                .italic()
                .foregroundColor(.secondary)
        }
    }
}

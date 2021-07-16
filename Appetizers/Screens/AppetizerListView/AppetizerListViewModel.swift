//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 5/31/21.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoadingListView = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        
        appetizers = MockData.orderItems
    }
}

//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 6/2/21.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func retrieveUser() {
        
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            //Encode the object into JSON data.
            let data = try JSONEncoder().encode(user)
            
            //Send the data to @AppStorage.
            userData = data
            
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.missingRequiredField
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmailAddress
            return false
        }
        
        return true
    }
}

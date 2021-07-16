//
//  AccountView.swift
//  Appetizers
//
//  Created by Arash Ebrahimi on 5/31/21.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    
                    TextField("First Name", text: $viewModel.user.firstName)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    DatePicker("Birthday",
                               selection: $viewModel.user.birthday,
                               in: Date().oneHundredTenYearsAgo ... Date().eighteenYearsAgo,
                               displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.brandPrimary))
            }
            .navigationTitle("👨‍💻 Account")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            .onAppear {
                viewModel.retrieveUser()
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

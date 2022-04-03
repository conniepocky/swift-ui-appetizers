//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Connie Waffles on 11/03/2022.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @AppStorage("user") private var userData: Data?
    
    func saveChanges() {
        guard isValidForm else { return }
        
        print("Changes have been saved")
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
 
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.surname.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail 
            return false
        }
        
        return true
    }
    
    
}

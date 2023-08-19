//
//  UserProfile.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/19/23.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastName)
    let email = UserDefaults.standard.string(forKey: kEmail)
    
    @Environment(\.presentationMode) var presentation
    
    
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("Profile")
            Text(firstName ?? "")
            Text(lastName ?? "")
            Text(email ?? "")
            Button("Logout", action: {
                
            })
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

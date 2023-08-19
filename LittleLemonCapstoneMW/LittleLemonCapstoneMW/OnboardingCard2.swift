//
//  Onboarding.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kPhoneNumber = "phone number key"



struct OnboardingCard2: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var eMail = ""
    @State var phoneNumber = ""
    
    @State var showAlert = false
    
    @EnvironmentObject var reg: AppState
    
    var body: some View {
        VStack{
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
            Text("Tell us about yourself!")
                .font(Font.Theme.displaySubtitle)
                .foregroundColor(Color.Theme.greenLL)
            
            
            VStack(alignment:.leading, content: {
                
                
                
                Text("First Name")
                    .font(.custom("Karla", size: 20))
                    .foregroundColor(Color.Theme.darkGrayLL)
                TextField("First name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                
                Text("Last Name")
                    .font(.custom("Karla", size: 20))
                    .foregroundColor(Color.Theme.darkGrayLL)
                
                TextField("Last name", text: $lastName)
                    .textFieldStyle(.roundedBorder)
                
                Text("Email")
                    .font(.custom("Karla", size: 20))
                    .foregroundColor(Color.Theme.darkGrayLL)
                
                TextField("Email", text: $eMail)
                    .textFieldStyle(.roundedBorder)
                
                Text("Phone Number")
                    .font(.custom("Karla", size: 20))
                    .foregroundColor(Color.Theme.darkGrayLL)
                
                TextField("Phone number", text: $phoneNumber)
                    .textFieldStyle(.roundedBorder)
                //Spacer()
                
                VStack {
                    HStack {
                         Spacer()
                        Button("Register", action: {
                            if !firstName.isEmpty && !lastName.isEmpty && !eMail.isEmpty {
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                                UserDefaults.standard.set(lastName, forKey: kLastName)
                                UserDefaults.standard.set(eMail, forKey: kEmail)
                                reg.state = true
                                
                            } else {
                                showAlert = true
                                
                            }
                        })
                        .buttonStyle(.bordered)
                        .background(Color.Theme.lightGrayLL)
                        .foregroundColor(Color("green"))
                        .controlSize(.regular)
                        .cornerRadius(16)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.Theme.greenLL, lineWidth: 2))
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Incomplete form"),
                                message: Text("Please fill out all fields to help us serve you better!"))
                        }
                                      Spacer()
                    }
                    Text("Swipe Right When You're Ready >>")
                        .font(Font.Theme.cardTitle)
                        .foregroundColor(.black)
                        .background(Color.Theme.yellowLL)
                }
            })
            .padding()
            //        .frame(height: 1000)
        }
    }
}
struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCard2()
    }
}

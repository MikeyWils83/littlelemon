//
//  ProfileView.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/13/23.
//

import SwiftUI

struct eMailLabel {
    let title: String
    var isChecked = false
    
}

struct ProfileImage: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 200, height: 200)
    }
}

struct ProfileField: View {
    let title: String
    let key: Keys
    
    enum Keys: String {
        case kFirstName = "kFirstName"
        case kLastName = "kLastName"
        case kEmail = "kEmail"
        case kPhoneNumber = "kPhoneNumber"
        
    }
    
    
    init(title: String, key: Keys) {
        self.title = title
        self.key = key
    }
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(title)
                .font(Font.Theme.paragraphText)
                .foregroundColor(Color.Theme.darkGrayLL)
            Text(UserDefaults.standard.string(forKey: key.rawValue) ?? "No User Information Provided"
            )
                .font(.custom("Karla", size: 18).weight(.medium))
        })
        
        //        .padding()
        
    }
}

struct ProfileView: View {
    
    @State var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? "Tilly"
    @State var lastName = ""
    @State var eMail = ""
    @State var phoneNumber = ""
    
    @State var orderStatus = eMailLabel(title: "Order Statuses")
    @State var passwordChanges = eMailLabel(title: "Password Changes")
    @State var specialOffers = eMailLabel(title: "Special Offers")
    @State var Newsletter = eMailLabel(title: "Newsletter")
    
    var fieldFirstName = ProfileField(title: "First Name", key: .kFirstName)
    var fieldLastName = ProfileField(title: "Last Name", key: .kLastName)
    var fieldEmail = ProfileField(title: "Email", key: .kEmail)
    var fieldPhoneNumber = ProfileField(title: "Phone Number", key: .kPhoneNumber)
    
    
    let profilePicture = ProfileImage(image: "Profile")
    
    let image = Image("Profile")
    
    @State private var eMailNotifications: [eMailLabel] = [eMailLabel(title: "Order statuses"), eMailLabel(title: "Password changes"), eMailLabel(title: "Special offers"), eMailLabel(title: "Newsletter")]
    
    
    
    var body: some View {
        
        NavigationView(content: {
            
            VStack(alignment: .leading, spacing: 15, content: {
                
                VStack(alignment: .leading, spacing: 10, content: { // PROFILE HEADER AND BUTTONS
                    
                    Text("Personal information")
                        .font(.custom("Karla", size: 24).weight(.medium))
                        .padding(.bottom, 5)
                    
                    Text("Avatar")
                        .font(Font.Theme.paragraphText)
                        .foregroundColor(Color.Theme.darkGrayLL)
                    
                    HStack(content: {
                        profilePicture
                            .offset(y: 45)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Spacer()
                            .frame(width: 20)
                        
                        Button(action: {
                            // Change action
                            
                        }, label: {
                            
                            Text("Change")
                                .foregroundColor(.white)
                                .font(.custom("Karla", size: 18).weight(.medium))
                            
                            
                                .frame(width: 85, height: 40)
                                .background (
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(Color.Theme.greenLL)
                                )
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            // Remove action
                            
                        }, label: {
                            Text("Remove")
                                .foregroundColor(Color.Theme.greenLL)
                                .font(.custom("Karla", size: 18).weight(.medium))
                            
                                .frame(width: 85, height: 40)
                                .background(
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .border(Color.Theme.greenLL)
                                )
                        })
                        Spacer()
                            .frame(width: 50)
                    })
                })
                
                //FORM STACK
                VStack(alignment: .leading, spacing:15, content: {
                    fieldFirstName
                    fieldLastName
                    fieldEmail
                    fieldPhoneNumber
                })
                
                
                
                
                // EMAIL NOTIFICATIONS STACK
                Text("Email notifications")
                    .font(.custom("Karla", size: 20).weight(.bold))
                
                VStack(alignment: .leading, spacing: 5,content: {
                    
                    HStack(content: {
                        Button(action: {
                            orderStatus.isChecked.toggle()
                        }, label: {
                            (orderStatus.isChecked ? Image(systemName: "checkmark.square.fill") : Image(systemName: "square"))
                                .foregroundColor(Color.Theme.greenLL)
                                .font(.title)
                        })
                        Text(orderStatus.title)
                            .font(.custom("Karla", size: 18))
                    })
                    
                    HStack(content: {
                        Button(action: {
                            passwordChanges.isChecked.toggle()
                        }, label: {
                            (passwordChanges.isChecked ? Image(systemName: "checkmark.square.fill") : Image(systemName: "square"))
                                .foregroundColor(Color.Theme.greenLL)
                                .font(.title)
                        })
                        Text(passwordChanges.title)
                            .font(.custom("Karla", size: 18))
                    })
                    
                    HStack(content: {
                        Button(action: {
                            specialOffers.isChecked.toggle()
                        }, label: {
                            (specialOffers.isChecked ? Image(systemName: "checkmark.square.fill") : Image(systemName: "square"))
                                .foregroundColor(Color.Theme.greenLL)
                                .font(.title)
                        })
                        Text(specialOffers.title)
                            .font(.custom("Karla", size: 18))
                    })
                    HStack(content: {
                        Button(action: {
                            Newsletter.isChecked.toggle()
                        }, label: {
                            (Newsletter.isChecked ? Image(systemName: "checkmark.square.fill") : Image(systemName: "square"))
                                .foregroundColor(Color.Theme.greenLL)
                                .font(.title)
                        })
                        Text(Newsletter.title)
                            .font(.custom("Karla", size: 18))
                    })
                    
                    //BOTTOM BUTTONS
                    Spacer()
                    VStack(alignment: .center
                           , content: {
                        Button(action: {
                            //LOGOUT ACTION
                        }, label: {
                            Text("Log out")
                                .font(.custom("Karla", size: 20))
                                .frame(minWidth: 350, maxHeight: 40)
                                .foregroundColor(.black)
                                .background (
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.Theme.yellowLL)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.brown)
                                        )
                                )
                        })
                        //                        Spacer()
                        
                        HStack(alignment: .center, content: {
                            Button(action: {
                                //DISCARD CHANGES ACTION
                            }, label: {
                                Text("Discard changes")
                                    .frame(minWidth: 170, maxHeight: 40)
                                    .font(.custom("Karla", size: 20))
                                    .foregroundColor(Color.Theme.greenLL)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(.clear)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color.Theme.greenLL))
                                    )
                            })
                            Spacer()
                            
                            Button(action: {
                                //SAVE CHANGES ACTION
                            }, label: {
                                Text("Save changes")
                                    .font(.custom("Karla", size: 20).weight(.bold))
                                    .foregroundColor(.white)
                                    .frame(minWidth: 170, maxHeight: 40)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.Theme.greenLL)
                                    )
                            })
                        })
                    })
                })
            })
        })
        .padding()
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

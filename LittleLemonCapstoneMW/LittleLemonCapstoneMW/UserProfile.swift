//
//  UserProfile.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
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

struct ProfileView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var eMail = ""
    @State var phoneNumber = ""
    
    @State var orderStatus = eMailLabel(title: "Order Statuses")
    @State var passwordChanges = eMailLabel(title: "Password Changes")
    @State var specialOffers = eMailLabel(title: "Special Offers")
    @State var Newsletter = eMailLabel(title: "Newsletter")
    
    
    let profilePicture = ProfileImage(image: "Profile")
    
    let image = Image("Profile")
    
    @State private var eMailNotifications: [eMailLabel] = [eMailLabel(title: "Order statuses"), eMailLabel(title: "Password changes"), eMailLabel(title: "Special offers"), eMailLabel(title: "Newsletter")]
    
    
    
    var body: some View {
        
        NavigationView(content: {
            
            VStack(alignment: .leading, content: {
                
                VStack(alignment: .leading, spacing: 10, content: { // PROFILE HEADER AND BUTTONS
                    
                    Text("Personal information")
                        .font(.custom("Karla", size: 24).weight(.medium))
                        .padding(.bottom, 5)
                    
                    Text("Avatar")
                        .font(.custom("Karla", size: 16))
                        .foregroundColor(Color("dark gray"))
                    
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
                                        .foregroundColor(Color("green"))
                                )
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            // Remove action
                            
                        }, label: {
                            Text("Remove")
                                .foregroundColor(Color("green"))
                                .font(.custom("Karla", size: 18).weight(.medium))
                            
                                .frame(width: 85, height: 40)
                                .background(
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .border(Color("green"))
                                )
                        })
                        Spacer()
                            .frame(width: 50)
                    })
                })
                
                //FORM STACK
                VStack(alignment: .leading, spacing:15, content: {
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("First Name")
                            .font(.custom("Karla", size: 15))
                            .foregroundColor(Color("dark gray"))
                        TextField("Tilly", text: $firstName)
                            .textFieldStyle(.roundedBorder)
                            .font(.custom("Karla", size: 18))
                    })
                    VStack(alignment:.leading, spacing: 5, content: {
                        
                        Text("Last Name")
                            .font(Font.Theme.paragraphText)
                            .foregroundColor(Color.Theme.darkGrayLL)
                        
                        TextField("Doe", text: $lastName)
                            .textFieldStyle(.roundedBorder)
                            .font(.custom("Karla", size: 18))
                    })
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("Email")
                            .font(Font.Theme.paragraphText)
                            .foregroundColor(Color.Theme.darkGrayLL)
                        TextField("tillyDoe@example. com'", text: $eMail)
                            .textFieldStyle(.roundedBorder)
                            .font(.custom("Karla", size: 18))
                    })
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Phone Number")
                            .font(Font.Theme.paragraphText)
                            .foregroundColor(Color.Theme.darkGrayLL)
                        TextField("number", text: $phoneNumber)
                            .textFieldStyle(.roundedBorder)
                            .font(.custom("Karla", size: 18))
                    })
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
                //TextField("Name", text: $firstName)
                
            })
            
            
            
        })
        .padding()

    }
    
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.previewDish.container.viewContext)
    }
}

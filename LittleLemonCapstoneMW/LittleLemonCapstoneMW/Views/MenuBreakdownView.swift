//
//  MenuBreakdownView.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
//

import SwiftUI


class MenuBreakdownViewModel: ObservableObject {
    //shared access to filtering options by categories

    @Published var starters = false
    @Published var mains = false
    @Published var desserts = false
    @Published var sides = false
    
    @Published var search = ""
}

struct MenuBreakdownView: View {
    @ObservedObject var menuToggle = MenuBreakdownViewModel()
    
    
    var body: some View {
        
        VStack( content: {
            VStack(alignment: .leading, content: {
                HStack(content: {
                    Text("ORDERS FOR DELIVERY!")
                        .font(.custom("Karla", size: 20).weight(.black))
                        
                    Image("Delivery van")
                        .resizable()
                        .scaledToFit()
                        .frame(width:40, height: 30)
                        
                    Spacer()
                                        })
            }) //Text Stack
            
            
                    
                VStack(alignment: .center) {
                    HStack(spacing: 25, content: {
                            
                            Button(action: {
                                menuToggle.starters.toggle()
                                menuToggle.mains = false
                                menuToggle.desserts = false
                                menuToggle.sides = false
                                menuToggle.search = "Starters"
                            }, label: {
                                Text("Starters")
                                    .font(.custom("Karla", size: 16).weight(.regular))
                                    .foregroundColor(Color("green"))
                                    .padding(.all, 10.0)
                                    .background(){
                                        menuToggle.starters ? RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color("yellow")):RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color("gray"))
                                    }
                            })
                            
                            
                            Button(action: {
                                menuToggle.starters = false
                                menuToggle.mains.toggle()
                                menuToggle.desserts = false
                                menuToggle.sides = false
                                menuToggle.search = "Mains"
                            }, label: {
                                Text("Mains")
                                    .font(.custom("Karla", size: 16).weight(.regular))
                                    .foregroundColor(Color("green"))
                                    .padding(.all, 10.0)
                                    .background(){
                                        menuToggle.mains ? RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color("yellow")):RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color("gray"))
                                    }
                            })
                            
                            Button(action: {
                                menuToggle.starters = false
                                menuToggle.mains = false
                                menuToggle.desserts.toggle()
                                menuToggle.sides = false
                                menuToggle.search = "Desserts"
                            }, label: {
                                Text("Desserts")
                                    .font(.custom("Karla", size: 16).weight(.regular))
                                    .foregroundColor(Color("green"))
                                    .padding(.all, 10.0)
                                    .background(){
                                        menuToggle.desserts ? RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color("yellow")):RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color("gray"))
                                    }
                            })
                            
                            Button(action: {
                                menuToggle.starters = false
                                menuToggle.mains = false
                                menuToggle.desserts = false
                                menuToggle.sides.toggle()
                                menuToggle.search = "Sides"
                            }, label: {
                                Text("Sides")
                                    .font(.custom("Karla", size: 16).weight(.regular))
                                    .foregroundColor(Color("green"))
                                    .padding(.all, 10.0)
                                    .background(){
                                        menuToggle.sides ? RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color("yellow")):RoundedRectangle(cornerRadius: 16)
                                            .foregroundColor(Color("gray"))
                                    }  //
                            })
                        })  // HSTACK
                    .frame(width: 370)
                }
                 // SCROLL VIEW
            Spacer()
            })  // TOP VSTACK
        .frame(height: 70)
        .padding(10)
        
    }  // BODY
}  // STRUCT

struct MenuBreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdownView()
    }
}

//
//  OnBoardingCard1.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/13/23.
//

import SwiftUI

struct OnBoarding: View {
    @StateObject var reg = AppState()
    
    var body: some View {
        
        TabView(content: {
            VStack(content: {
                
                Image("Logo")
                    .background()
                
                VStack {
                    Text("Welcome!\n")
                        .font(Font.Theme.displayTitle)
                        .foregroundColor(Color.Theme.yellowLL)
                        .padding(.bottom,-100)
                    
                    Text("Before we start, please let us get to know you so we can serve you better!")
                        .font(Font.Theme.displaySubtitle)
                        .foregroundColor(Color.Theme.lightGrayLL)
                        .padding()
                }
                .background(Color.Theme.greenLL)
                Spacer()
                Text("Swipe Right When You're Ready >>")
                    .font(Font.Theme.cardTitle)
                    .foregroundColor(.black)
                    .background(Color.Theme.yellowLL)
                    
            })
            //.padding()
            ZStack(alignment: .bottomTrailing, content:  {
                OnboardingCard2()
            })
            
            ZStack(content: {
                VStack{
                    Spacer()
                    Text("You're All Set!")
                        .font(Font.Theme.displayTitle)
                        .foregroundColor(Color.Theme.greenLL)
                    Text("Swipe down to enjoy some delicius food")
                    Spacer()
                    Image(systemName: "arrow.down")
                        .font(.largeTitle).fontWeight(.bold)
                        .foregroundColor(Color.Theme.greenLL)
                }
                
            })
            
        })
        .tabViewStyle(.page)
        
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}

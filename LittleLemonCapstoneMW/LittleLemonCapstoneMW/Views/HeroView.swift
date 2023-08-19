//
//  HeroView.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
//

import SwiftUI

struct HeroView: View {
    
    @State var search = ""
    
  
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0, content: {
            VStack(alignment: .leading, spacing: -20,content: {
                
                Text("Little Lemon")
                    .font(.custom("Markazi Text", size: 64).weight(.medium))
                    .foregroundColor(Color("yellow"))
                
                Text("Chicago")
                    .font(.custom("Karla", size: 40).weight(.regular))
                    .foregroundColor(Color("gray"))
            })
            .padding(.bottom, -10)
            HStack(content: {
                
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .font(.custom("Karla", size: 18).weight(.medium))
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color.Theme.lightGrayLL)
                
               Image("Hero image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .offset(y: -20)
            })
            
            HStack(content: {
                Spacer()
                TextField("\u{1F50D}   Search...", text: $search)  //SEARCH BAR
                    .textFieldStyle(.roundedBorder)
            })
        })
        .padding()
        .background(Color.Theme.greenLL)
        
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}

//
//  HeaderView.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {

            VStack(alignment: .center, content: {
                
                ZStack(content: {
                    HStack(content: {
                        Spacer()
                        Image("Logo")
                            .frame(width: 140, height: 40)
                            .foregroundColor(.gray)
                        Spacer()
                    })
                   
                    HStack(alignment: .bottom, content: {
                        Spacer()
                        Image("Profile")
                            .resizable()
                            .frame(width: 50, height: 50)
                    })
                    .padding(.horizontal)
                })
                Divider()
                    //.frame(height: 1)
                   // .background(Color.gray)
                    
                    
            })
            //.border(.blue)
            //.padding(.vertical,5)
    }
      
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.previewDish.container.viewContext)
    }
}

//
//  OnBoarding.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
//

import SwiftUI

struct Home: View {
    
    
    
    
    var body: some View {
        
        VStack(spacing: 0, content: {
            
            HeroView()
            MenuBreakdownView()
            Dishes()
        })
        .frame(height: 646)
        

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.previewDish.container.viewContext)
    }
}

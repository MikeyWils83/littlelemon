//
//  MenuRow.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/7/23.
//

import SwiftUI

struct MenuRow: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, content: {
                Text("Greek Salad")
                    .font(.custom("Karla", size: 18))
                    //.font(Font.Theme.cardTitle)
                Spacer()
                
                Text("The famous greek salad of cripsy lettuce, perppers, olives and our Chicago sauce")
                    //.font(Font.Theme.paragraphText)
                    //.foregroundColor(Color.Theme.greenLL)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 260)
                    .lineLimit(2)
                Spacer()
                Text("$12.99")
                    //.font(Font.Theme.highlightText)
                    //.foregroundColor(Color.Theme.greenLL)
            })
            Spacer()
            Rectangle()
                //.resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
        }
        .padding()
        .frame(height: 115)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow()
    }
}

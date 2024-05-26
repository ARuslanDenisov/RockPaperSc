//
//  ImageElement.swift
//  RockPaperSc
//
//  Created by Руслан on 26.05.2024.
//

import SwiftUI

struct ImageElement: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(3)
            .background(.white)
            .clipShape(.circle)
            .shadow(radius: 10)
    }
}

//#Preview {
//    ImageElement(imageName: "rock")
//}

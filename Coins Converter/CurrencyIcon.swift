//
//  CurrencyIcon.swift
//  Coins Converter
//
//  Created by Vinicius Oliveira on 21/08/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName:   String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // Currency name
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
        
    }
}

#Preview {
    CurrencyIcon(currencyImage: .goldpiece, currencyName: "Gold Piece")
}


//                    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
//
//                    CurrencyIcon(currencyImage: .silverpenny, currencyName: "Silver Penny")
//
//                    CurrencyIcon(currencyImage: .silverpiece, currencyName: "Silver Piece")
//
//                    CurrencyIcon(currencyImage: .goldpenny, currencyName: "Gold Penny")
//
//                    CurrencyIcon(currencyImage: .goldpiece, currencyName: "Gold Piece")

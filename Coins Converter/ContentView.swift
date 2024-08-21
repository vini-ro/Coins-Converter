//
//  ContentView.swift
//  Coins Converter
//
//  Created by Vinicius Oliveira on 20/08/24.
//

import SwiftUI

struct ContentView: View {
    @State  var showExchangeInfo = false
    @State  var leftAmout = ""
    @State  var rightAmout = ""
    
    var body: some View {
        ZStack{
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                // Pracing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Currency conversion section
                HStack{
                    // Left conversion section
                    VStack{
                        // Currency
                        HStack{
                            // Currency image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom, -5)
                        // Textfield
                        TextField("Amount", text: $leftAmout)
                            .textFieldStyle(.roundedBorder)
                        
                        
                    }
                    
                    
                    // Equal sing
                    Image(systemName: "equal")
                    
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack{
                        // Currency
                        HStack{
                            // Currency text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom, -5)
                        
                        // Textfield
                        TextField("Amount", text: $rightAmout)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                
                
                Spacer()
                
                // Info button
                HStack {
                    Spacer()
                    
                    Button {
                        
                        showExchangeInfo.toggle()
                        
                    } label: {
                        
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfo()
                    }
                }
                
            }
            //            .border(.blue)
            
        }
        
        
    }
}

#Preview {
    ContentView()
}

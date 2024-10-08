//
//  ContentView.swift
//  Coins Converter
//
//  Created by Vinicius Oliveira on 20/08/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State  var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State  var leftAmout = ""
    @State  var rightAmout = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
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
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        // Textfield
                        TextField("Amount", text: $leftAmout)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                        
                        
                        
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
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        // Textfield
                        TextField("Amount", text: $rightAmout)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                        
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
                }
            }
            //            .border(.blue)
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: rightAmout) {
            if rightTyping {
                leftAmout = rightCurrency.convert(rightAmout, to: leftCurrency)
            }
            
        }
        .onChange(of: leftAmout) {
            if leftTyping == true {
                rightAmout = leftCurrency.convert(leftAmout, to: rightCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmout = rightCurrency.convert(rightAmout, to: leftCurrency)
            
        }
        .onChange(of: rightCurrency) {
            rightAmout = leftCurrency.convert(leftAmout, to: rightCurrency)
            
        }
        
        .sheet(isPresented: $showExchangeInfo){
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency){
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
        
    }
}

#Preview {
    ContentView()
}

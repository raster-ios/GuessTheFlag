//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gena Raster on 7.12.21.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                }
                
                
                ForEach(0..<3) { number in
                    Button {
                        // button was tapped
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                    
                }
                
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gena Raster on 7.12.21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                }
                .foregroundColor(.white)
                
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule(style: .continuous))
                            .shadow(radius: 7)
                    }
                    
                }
                
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", role: .cancel) {
                askQuestion()
            }
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped (_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
        } else {
            scoreTitle = "False!"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

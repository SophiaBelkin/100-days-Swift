//
//  ContentView.swift
//  P2_GuessTheFlag
//
//  Created by Sophia Lu on 6/25/21.
//

import SwiftUI

struct ContentView: View {

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var message = ""
    @State private var score = 0
    @State private var showingScore: Bool = false
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack (spacing: 30){
                Text("Please select your country")
                    .foregroundColor(.white)
                Text(countries[correctAnswer])
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

                

                ForEach(0..<3){ number in
                    Button(action: {
                        self.checkAnswer(number)
                    }) {
                        Image(self.countries[number])
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                        
                    }
                }
                .alert(isPresented: $showingScore) {
                    Alert(title: Text(message), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                         self.askQuestion()
                     })
                }
       
                Spacer()
            }
        }
    }
    
    func checkAnswer(_ number: Int) {
        if number == correctAnswer {
            message =  "Correct"
            score += 1
        } else {
            message =  "Wrong!"
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

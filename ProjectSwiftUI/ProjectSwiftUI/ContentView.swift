//
//  ContentView.swift
//  ProjectSwiftUI
//
//  Created by Mac on 1/3/2022.
//

import SwiftUI

struct ContentView: View {
    @State var correctAnswer: Bool = false
    @State var showingScore: Bool = false
    @State var score: Int = 0
    @State var numbers = ["1", "2", "3", "4", "5", "6", "7"].shuffled()
    @State var selectedNumber = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack {
                Text("Select number")
                    .foregroundColor(.white)
                    .font(.title).bold()
                Text(numbers[selectedNumber])
                    .foregroundColor(.white)
                    .font(.title)
                
                ForEach(0..<3) { number in
                    Button {
                        tapped(number)
                    } label: {
                        Text(numbers[number])
                            .foregroundColor(.white)
                    } .frame(width: 120, height: 120, alignment: .center)
                        .border(.white, width: 2)
                        .background(Color.red)
                }
            }
        }.alert(correctAnswer ? "Correct" : "Wrong", isPresented: $showingScore) {
            Button("Continue", action: changeQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func tapped(_ number: Int) {
        correctAnswer = number == selectedNumber
        showingScore = true
        score = correctAnswer ? score + 5 : score
    }
    
    func changeQuestion() {
        numbers.shuffle()
        selectedNumber = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

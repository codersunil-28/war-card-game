//
//  ContentView.swift
//  war-challenge
//
//  Created by sunil kumar on 13/08/22.
//

import SwiftUI

struct ContentView: View {
    
    /* These four properties are source of truth
     because it represents how the UI should look.
     
     Cannot assign to property: 'self' is immutable
     To make changes in the property, we need to use
     Property wrapper (especially State) so it can
     change the behaviour of the property.
     
     @State property:
     1. It allows to change the value in it.
     2. In the view code, any reference to
     the state properties, they will get notified
     of the data changes and then your UI will
     update automatically based on the new data.
     
     Any pieces of view tied to state property
     detect the change in data and updates
     automatically.
     
     A state property is a piece of data that
     this ContentView depends on
     
     The properties whose value represents the state
     of an app are called source of truth.
     */
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    
    var body: some View {
        
        ZStack {
            Image("background")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button {
                    
                    // Generate a random number between 2 and 14 .
                    
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update the cards
                        playerCard = "card" + String(playerRand)
                        cpuCard = "card" + String(cpuRand)
                    
                    // Update the score
                    if playerRand > cpuRand{
                        playerScore += 1
                    }else if cpuRand > playerRand{
                        cpuScore += 1
                    }
                        
                } label: {
                    Image("dealbutton")
                }

                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    VStack(spacing: 20.0) {
                        
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20.0) {
                        
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
            } //end main VStack
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

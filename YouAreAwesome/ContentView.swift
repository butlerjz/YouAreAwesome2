//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jackson Butler on 8/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var image = ""
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            
            Spacer()
            
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let imageString1 = "hand.thumbsup"
                let imageString2 = "sun.max.fill"
                
                message = (message == message1 ? message2 : message1)
                image = (image == imageString1 ? imageString2 : imageString1)
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}

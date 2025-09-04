//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jackson Butler on 8/25/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastAudioNumber = -1
    let numberOfImages = 10
    let numberOfSounds = 6
    
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                
                //Messages
                let messages = ["You are Awesome!", "You're An Amazing Programmer!", "You are Great!", "You Make Me Smile!"]
                
                var currentMessageNumber: Int
                
                repeat {
                    currentMessageNumber = Int.random(in: 0...messages.count - 1)
                } while lastMessageNumber == currentMessageNumber
                
                message = messages[currentMessageNumber]
                lastMessageNumber = currentMessageNumber
                
                //Images
                var currentImageNumber: Int
                
                repeat {
                    currentImageNumber = Int.random(in: 0...numberOfImages - 1)
                } while lastImageNumber == currentImageNumber
                
                imageName = "image\(currentImageNumber)"
                lastImageNumber = currentImageNumber
                
                //Sound
                var currentAudioNumber: Int
                
                repeat {
                    currentAudioNumber = Int.random(in: 0...numberOfSounds - 1)
                } while currentAudioNumber == lastAudioNumber
                
                lastAudioNumber = currentAudioNumber
                soundName = "sound\(currentAudioNumber)"
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Could not read file named \(soundName)")
                    return }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
                }
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  ScrollView
//
//  Created by Tomasz Kielar on 25/06/2019.
//  Copyright © 2019 Tomasz Kielar. All rights reserved.
//

import SwiftUI

struct Player : Identifiable {
    var id : UUID
    var name : String
    var describtion : String
    var imageName : String
    
    init(name : String, desc : String, img : String) {
        id = UUID()
        self.name = name
        self.describtion = desc
        self.imageName = img
    }
}

let Players : [Player] = [
    Player(name: "Ronaldinho",
           desc: "Ronaldinho – brazylijski piłkarz grający zazwyczaj na pozycji pomocnika lub napastnika, mistrz świata 2002, mistrz Ameryki Południowej, zwycięzca Ligi Mistrzów 2006. Posiada obywatelstwo brazylijskie i hiszpańskie.",
           img: "one"),
    Player(name: "Messi", desc: "Argentyński piłkarz występujący na pozycji pomocnika lub napastnika w hiszpańskim klubie FC Barcelona, której jest kapitanem oraz w reprezentacji Argentyny, której także jest kapitanem. Srebrny medalista Mistrzostw Świata 2014, uczestnik Mistrzostw Świata 2018", img: "two"),
    Player(name: "Cristiano Ronaldo", desc: "Portugalski piłkarz występujący na pozycji skrzydłowego lub napastnika we włoskim klubie Juventus oraz w reprezentacji Portugalii, której jest kapitanem. Uważany jest za jednego z najlepszych piłkarzy w historii futbolu.", img: "three")

]

struct ContentView : View {
    var body: some View {
        PlayersView()
    }
}

struct PlayersView : View {
    @State var name : String = ""
    @State var desc : String = ""
    @State var guys = Players
    
    var body: some View {
        VStack(){ ScrollView(showsHorizontalIndicator:false) {
            HStack {
                ForEach(self.guys.identified(by: \.id)) {
                    footbaler in
                    PlayerView(name: footbaler.name, desc: footbaler.describtion, image: footbaler.imageName)
                    .tapAction({
                        self.name = footbaler.name
                        self.desc = footbaler.describtion
                    })
                }
            }
        }
        
            PlayerDetailView(name:
                name,desc: desc)
            
            
            Spacer()
            
            Button(action: {
                self.name = ""
                self.desc = ""
            }) {
                Text("Press to reset")
                }
                .frame(width:200,height:50)
                .background(Color.black)
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 10)
        }.padding()
     //   .lineSpacing(50)
    }
}

struct PlayerView : View {
    var name: String
    var desc: String
    var image : String
    var body: some View {
    VStack{
        ZStack(alignment:.bottomLeading){
            Image(image)
            .resizable()
            .cornerRadius(10)
            .frame(width:200,height: 200)
            Rectangle()
            .frame(height:40)
            .opacity(0.5)
            .blur(radius: 10)
            Text(name)
            .font(.title)
            .color(Color.white)
            .padding(.leading, 15)
        }
        Text(desc)
        .color(.secondary)
        .lineLimit(nil)
        .frame(width:190)
        .font(.subheadline)
        
        
        }.padding()
        
    }
}

struct PlayerDetailView : View {
    var name : String
    var desc : String
    
    var body: some View {
        VStack(alignment:.leading){
            Text(name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(desc)
                .font(.subheadline)
                .color(.secondary)
                .multilineTextAlignment(.leading)
            .lineLimit(nil)
            
        }
    }
}
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
#endif

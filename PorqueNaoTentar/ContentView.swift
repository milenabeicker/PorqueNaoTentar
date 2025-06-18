//
//  ContentView.swift
//  PorqueNaoTentar
//
//  Created by Milena Beicker on 17/06/25.
//

import SwiftUI

struct ContentView: View {
    
    var atividades = ["Volleyball","Boxing", "Yoga", "Walk", "Dance", "Run", "Basketball","Flexibility", "Handball", "Jumprope", "Pilates"]
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
  
    @State private var selected = "Volleyball"
    @State private var id = 1
    
    var body: some View {
        VStack {
          //  Spacer()
            
            Text("Porque não tentar?")
                .font(.largeTitle.bold())
            
            Spacer()
            
            VStack {
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .overlay(
                        Image(systemName: "figure.\(selected.lowercased())").font(.system(size: 144))
                            .foregroundColor(.white)
                    )
                
                Text("\(selected)")
                    .font(.title)
            }
            .transition(.slide)
            .id(id)
            
            Spacer()
            
            Button("Tente novamente") {
                // mudança de atividade quando o botão for pressionado
                withAnimation(.easeInOut(duration: 1))  {
                    selected = atividades
                        .randomElement() ?? "Volleyball"; id += 1
                }
            }
            .buttonStyle(.borderedProminent)
        }
        
    }
}

#Preview {
    ContentView()
}

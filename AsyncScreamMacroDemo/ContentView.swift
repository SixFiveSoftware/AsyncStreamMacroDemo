//
//  ContentView.swift
//  AsyncScreamMacroDemo
//
//  Created by BJ Miller on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ViewModel()
    @State private var characterName = ""

    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await viewModel.fetchRandomCharacterName()
                }
            }, label: {
                Text("Fetch character")
            })
            Text(characterName)
        }
        .padding()
        .task {
            for await name in viewModel.name {
                characterName = name
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  AsyncScreamMacroDemo
//
//  Created by BJ Miller on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ViewModel()

    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await viewModel.fetchRandomCharacterName()
                }
            }, label: {
                Text("Fetch character")
            })
            Text(viewModel.characterName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

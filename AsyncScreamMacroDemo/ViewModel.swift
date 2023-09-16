//
//  ViewModel.swift
//  AsyncScreamMacroDemo
//
//  Created by BJ Miller on 9/16/23.
//

import CreateAsyncStream
import Foundation
import Observation

@CreateAsyncStream(of: String.self, named: "name")
class ViewModel {
    @MainActor
    func fetchRandomCharacterName() async {
        let id = Int.random(in: 1...100)
        let (data, _) = try! await URLSession.shared.data(from: URL(string: "https://rickandmortyapi.com/api/character/\(id)")!)
        let char = try! JSONDecoder().decode(RAMCharacter.self, from: data)
        nameContinuation.yield(char.name)
    }
}

struct RAMCharacter: Decodable {
    let name: String
}

//
//  Navio.swift
//  BatalhaNaval
//
//  Created by Ritielen Reis on 05/04/25.
//

import Foundation

struct Navio: Identifiable {
    let id: Int                      // Identificador único
    let nome: String
    let tamanho: Int
    var posicoes: [Int]
    var atingido: [Bool]                // Quais partes já foram atingidas

    init(id: Int, nome: String, tamanho: Int, posicoes: [Int]) {
        self.id = id
        self.nome = nome
        self.tamanho = tamanho
        self.posicoes = posicoes
        self.atingido = Array(repeating: false, count: tamanho)
    }

    mutating func registrarAtaque(posicao: Int) -> Bool {
        if let index = posicoes.firstIndex(of: posicao) {
            atingido[index] = true
            return true
        }
        return false
    }

    var destruido: Bool {
        atingido.allSatisfy { $0 }
    }
}

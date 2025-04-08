//
//  Tabuleiro.swift
//  BatalhaNaval
//
//  Created by Ritielen Reis on 05/04/25.
//

import Foundation
import Combine

class Tabuleiro: ObservableObject {
    @Published var coordenadas: [Coordenada] = []
    
    init() {
        resetarTabuleiro()
    }

    func resetarTabuleiro() {
        coordenadas = (0..<25).map { Coordenada(id: $0, temNavio: false, foiAtacada: false) }
        //$0 é um atalho para o primeiro. Essa linha criar uma lista de 25 coordenadas, com id variando de 0 a 24
    }

    //verifica se é a coordenada já tem navio (equivale ao Tabuleiro.setSubmarino)
    func posicionarNavio(em id: Int) -> Bool {
        guard coordenadas[id].temNavio == false else { return false }
        coordenadas[id].temNavio = true
        return true
    }
    
    //verifica se é a coordenada é válida para o ataque ou nao (equivale ao Tabuleiro.atirar)
    func atacarCoordenada(id: Int) -> Bool {
        guard coordenadas[id].foiAtacada == false else { return false }// se a coordenada x nao foi atacada ainda, mudamos o estado. se já foi, o pedido é recusado (retorna false)
        coordenadas[id].foiAtacada = true
        return coordenadas[id].temNavio
    }

    // verifica na lista de coordenadas se todas as que tem navio, já foram atacadas.
    func todosNaviosDestruidos() -> Bool {
        !coordenadas.contains { $0.temNavio && $0.foiAtacada }
    }
}


//
//  BatalhaNavalApp.swift
//  BatalhaNaval
//
//  Created by Ritielen Reis on 05/04/25.
//

import SwiftUI

@main
struct BatalhaNavalApp: App {
    var body: some Scene {
        WindowGroup {
            Inicial(jogo: Jogo(jogador1: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogador2: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogadorAtual: 1, jogoFinalizado: false))
        }
    }
}

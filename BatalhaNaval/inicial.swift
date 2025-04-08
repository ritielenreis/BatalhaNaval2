//
//  ContentView.swift
//  BatalhaNaval
//
//  Created by Ritielen Reis on 05/04/25.
//

import SwiftUI

struct Inicial: View {
    @ObservedObject var jogo: Jogo


    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {

                
                Text("BATALHA NAVAL") //Muda para jogo.jogador1.naviosRestantes
                    .font(.custom("Impact", size: 50))
                    .foregroundColor(.blue)
                    .padding()

                NavigationLink(destination: MenuJogador1(jogo: jogo)) {
                    Text("Iniciar Jogo")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                
                
            }
            .padding()
        }
    }
}

#Preview {
    Inicial(jogo: Jogo(jogador1: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogador2: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogadorAtual: 1, jogoFinalizado: false))
}


//
//  MenuJogador2.swift
//  BatalhaNaval
//
//  Created by Ritielen Reis on 08/04/2025.
//

import SwiftUI

struct MenuJogador2: View {
    @ObservedObject var jogo: Jogo

    let columns = Array(repeating: GridItem(.flexible()), count: 5)

    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                Text("Jogador 2 - Posicione seus Navios")
                    .font(.title2)
                
                Text("Restantes: \(jogo.naviosRestantes2)") //Muda para jogo.jogador1.naviosRestantes
                    .font(.subheadline)
                
                LazyVGrid(columns: columns, spacing: 5) {

                    ForEach(jogo.jogador2.tabuleiroProprio.coordenadas) { coord in
                        Button(action: {
                            
                            jogo.posicionarNavioJogador2(em: coord.id)
                            
                        }) {
                            //Adicionar  Visualização igual menuJogador1
                            Rectangle()
                                .foregroundColor(coord.temNavio ? .blue : .gray)
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                        
                        }
            
                        .disabled(coord.temNavio || jogo.naviosRestantes2 == 0)
                    }
                }
                
                if jogo.tabuleiroDefinido2 {
                    Text("navios escolhidos:")
                    ForEach(jogo.jogador2.tabuleiroProprio.coordenadas) { coord in
                        if coord.temNavio{
                            Text("\(coord.id)")
                                .font(.title2)
                                .padding()
                            
                        }
                    }
                    NavigationLink(destination: GameView(jogo: jogo)) {
                        Text("Jogar")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    MenuJogador2(jogo: Jogo(jogador1: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogador2: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogadorAtual: 1, jogoFinalizado: false))
}


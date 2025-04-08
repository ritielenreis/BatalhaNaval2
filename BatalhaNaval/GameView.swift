//
//  GameView.swift
//  BatalhaNaval
//
//  Created by Ritielen Reis on 06/04/25.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var jogo: Jogo

    let columns = Array(repeating: GridItem(.flexible()), count: 5)

    var body: some View {
        VStack(spacing: 20) {
            Text("Turno do Jogador \(jogo.jogadorAtual)")
                .font(.title2)

            Text("Ataque o tabuleiro inimigo")
                .font(.subheadline)

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach((jogo.jogadorAtual == 1 ? jogo.jogador2.tabuleiroProprio.coordenadas : jogo.jogador1.tabuleiroProprio.coordenadas)) { coord in  //se for o turno do jogador 1 entao busca as coordenadas do jopgador 2, e vice versa
                    Button(action: {
                        jogo.realizarJogada(em: coord.id)

                    }) {
                        Rectangle()
                            .foregroundColor(corPara(coord: coord))
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                    }
                    .disabled(coord.foiAtacada || jogo.jogoFinalizado)
                }
            }

            /*if jogo.jogoFinalizado, let vencedor = jogo.vencedor {
                Text("🏆 \(vencedor) venceu!")
                    .font(.title2)
                    .padding()

                Button("Jogar Novamente") {
                    jogo.reiniciarJogo()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }*/
        }
        .padding()
    }

    func corPara(coord: Coordenada) -> Color {
        if !coord.foiAtacada {
            return .gray
        } else if coord.temNavio {
            return .red
        } else {
            return .white
        }
    }
}

#Preview {
    GameView(jogo: Jogo(jogador1: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogador2: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogadorAtual: 1, jogoFinalizado: false))
}


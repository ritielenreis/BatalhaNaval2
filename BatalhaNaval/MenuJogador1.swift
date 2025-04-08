//
//  ContentView.swift
//  BatalhaNaval
//
//  Created by Ritielen Reis on 05/04/25.
//

import SwiftUI

struct MenuJogador1: View {
    @ObservedObject var jogo: Jogo

    let columns = Array(repeating: GridItem(.flexible()), count: 5)

    var body: some View {
        NavigationStack{
            VStack(spacing: 16) {
                Text("Jogador 1 - Posicione seus Navios")
                    .font(.title2)
                
                Text("Restantes: \(jogo.naviosRestantes1)") //Muda para jogo.jogador1.naviosRestantes
                    .font(.subheadline)
                
                
                //Se alterar jogo.posicionarNavioJogador(em: coord.id) para jogo.jogador1.posicionarNavioJogador(em: coord.id) o valor de coord.tem navio não é salvo para esta view
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(jogo.jogador1.tabuleiroProprio.coordenadas) { coord in
                        Button(action: {
                            jogo.posicionarNavioJogador1(em: coord.id) //Muda para jogo.jogador1.posicionarNavioJogador
                            
                        }) {
                            if (coord.foiAtacada == true && coord.temNavio == true) {
                                //navio atacado
                                Image(systemName: "xmark.circle")
                                    .frame(width: 50, height: 50)
                            } else if (coord.foiAtacada == true && coord.temNavio == false){
                                // agua atacada
                                Image(systemName: "sun.fill")
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                            } else if (coord.foiAtacada == false && coord.temNavio == true){
                                //navio nao atacado
                                Image(systemName: "sailboat.fill")
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                            } else if (coord.foiAtacada == false && coord.temNavio == false){
                                //nao tem navio e nao foi atacado
                                Image(systemName: "water.waves")
                                    .frame(width: 50, height: 50)
                                    .border(Color.black)
                            }
                        }
                        .disabled(coord.temNavio || jogo.naviosRestantes1 == 0) //Muda para jogo.jogador1.naviosRestantes
                    }
                }
                
                if jogo.tabuleiroDefinido1 {
                    Text("navios escolhidos:")
                    
                    ForEach(jogo.jogador1.tabuleiroProprio.coordenadas) { coord in
                        if coord.temNavio{
                            Text("\(coord.id)")
                                .font(.title2)
                                .padding()
                            
                        }
                    }
                    
                    NavigationLink(destination: MenuJogador2(jogo: jogo)) {
                        Text("Definir Navios Jogador 1")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }else {
                    NavigationLink(destination: MenuJogador2(jogo: jogo)) {
                        Text("Definir Navios Jogador 1")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }.disabled(true)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MenuJogador1(jogo: Jogo(jogador1: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogador2: Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: []), jogadorAtual: 1, jogoFinalizado: false))
}


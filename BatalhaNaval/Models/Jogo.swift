//
//  Jogo.swift
//  BatalhaNaval
//
//  Created by Ritielen Reis on 05/04/25.
//

import Foundation

class Jogo: ObservableObject, Hashable {
    @Published var jogador1: Jogador
    @Published var jogador2: Jogador
    @Published var jogadorAtual: Int = 1 // 1 ou 2
    @Published var jogoFinalizado: Bool = false
    @Published var vencedor: String? = nil
    @Published var naviosRestantes1: Int = 5
    @Published var naviosRestantes2: Int = 5
    @Published var tabuleiroDefinido1: Bool = false
    @Published var tabuleiroDefinido2: Bool = false
    
    
    var id = UUID()
    
    init(jogador1: Jogador, jogador2: Jogador, jogadorAtual: Int, jogoFinalizado: Bool, vencedor: String? = nil) {
        self.jogador1 = jogador1
        self.jogador2 = jogador2
        self.jogadorAtual = jogadorAtual
        self.jogoFinalizado = jogoFinalizado
        self.vencedor = vencedor

    }
    
    
    //Funcoes que torna a classe Jogo Hashble (iterável)
    static func == (lhs: Jogo, rhs: Jogo) -> Bool {
            return lhs.id == rhs.id // Comparando pelo ID único
        }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) // Usando o ID único para gerar o hash
    }
    
    
    func posicionarNavioJogador1(em id: Int){
        if naviosRestantes1 > 0 && jogador1.tabuleiroProprio.posicionarNavio(em: id) {
            naviosRestantes1 -= 1
        }

        if naviosRestantes1 == 0 {
            tabuleiroDefinido1 = true
        }
    }
    func posicionarNavioJogador2(em id: Int){
        if naviosRestantes2 > 0 && jogador2.tabuleiroProprio.posicionarNavio(em: id) {
            naviosRestantes2 -= 1
        }

        if naviosRestantes2 == 0 {
            tabuleiroDefinido2 = true
        }
    }

    func reiniciarJogo() {
        jogador1 = Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: [])
        jogador2 = Jogador(tabuleiroProprio: Tabuleiro(), tirosFeitos: [])
        jogadorAtual = 1
        jogoFinalizado = false
        vencedor = nil
        naviosRestantes1 = 5
        naviosRestantes2 = 5
        tabuleiroDefinido1 = false
        tabuleiroDefinido2 = false
    }
    

    func realizarJogada(em id: Int){
        
        
        
        //adicionar logica aqui
        if jogadorAtual == 1 {
            let jogada = jogador2.tabuleiroProprio.atacarCoordenada(id: id)
            if jogada {
                jogador1.tirosFeitos.append(id)
            }
        } else {
            let jogada = jogador1.tabuleiroProprio.atacarCoordenada(id: id)
            if jogada {
                jogador2.tirosFeitos.append(id)
            }
        }
        checarVencedor()
        alternarTurno()
        
    }
    func alternarTurno() {
        jogadorAtual = jogadorAtual == 1 ? 2 : 1 // se o jogador atual é o 1, passa a ser o 2 e vice e versa
    }
    
    // se todos os navios  foram destruidos, jogo acaba
    func checarVencedor(){
        if jogador2.tabuleiroProprio.todosNaviosDestruidos(){
            jogoFinalizado = true
            vencedor = "Jogador 1"
        } else if jogador1.tabuleiroProprio.todosNaviosDestruidos() {
            jogoFinalizado = true
            vencedor = "Jogador 2"
        } else {
            jogoFinalizado = false
            vencedor = nil
            //se jogador1.tabuleiroInimigo.todosNaviosDestruidos = true, vencedor = jogador1
            // senao se jogador2.tabuleiroInimigo.todosNaviosDestruidos = true, vencedor = jogador2
            //senao continuar jogo
        }
    }
}

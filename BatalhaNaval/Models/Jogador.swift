//
//  Jogador.swift
//  BatalhaNaval
//
//  Created by Ritielen Reis on 05/04/25.
//

import Foundation

class Jogador{
    var tabuleiroProprio: Tabuleiro
    var tirosFeitos: [Int] = []
    var naviosRestantes: Int = 5
    var tabuleiroDefinido: Bool = false
    
    init(tabuleiroProprio: Tabuleiro = Tabuleiro(), tirosFeitos: [Int]) {
        self.tabuleiroProprio = tabuleiroProprio
        self.tirosFeitos = tirosFeitos
        self.naviosRestantes = 5
        self.tabuleiroDefinido = false
    }
    
    //VER SE É NECESSÁRIO O TABULEIRO INIMIGO
    func atirar(id: Int, tabuleiroInimigo: Tabuleiro) -> Bool {
        guard !tirosFeitos.contains(id) else {return false}//se tirosFeitos nao contem o id, o tiro é adicionado á lista. Se contem o pedido é recusado.
        tirosFeitos.append(id)
        let resultado = tabuleiroInimigo.atacarCoordenada(id: id)
        return resultado
    }
    

    //VERIFICAR: criei essa funcao durante a resolucao de um bug, mas acho que agr nao precisa mais
    func adicionarTiro(tiro: Int) {
        tirosFeitos.append(tiro)
        }
    
    
    func posicionarNavioJogador(em id: Int){
        if naviosRestantes > 0 && tabuleiroProprio.posicionarNavio(em: id) {
            naviosRestantes -= 1
        }

        if naviosRestantes == 0 {
            tabuleiroDefinido = true
        }
    }
    
    
    func verificarTabuleiro() -> Bool{
        //esse método seria equivalente ao Tabuleiro.todosNaviosDestruidos??
        //adicionar codigo correspondente
        return true
    }
    
    
}

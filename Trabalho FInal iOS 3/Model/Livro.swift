//
//  Livro.swift
//  Trabalho FInal iOS 3
//
//  Created by Savio Silva on 25/11/18.
//  Copyright © 2018 Igor Vilar. All rights reserved.
//

import Foundation

class Livro {
    var nome: String = ""
    var autor: String = ""
    var ano: String = ""
    
    init(nome : String, autor: String, ano: String) {
        self.nome = nome
        self.autor = autor
        self.ano = ano
    }
    
    init(){
        
    }
}

//
//  CadastraLivroViewController.swift
//  Trabalho FInal iOS 3
//
//  Created by Savio Silva on 25/11/18.
//  Copyright © 2018 Igor Vilar. All rights reserved.
//

import UIKit

class CadastraLivroViewController: UIViewController {
    
    let controller = LivrosController()

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var autorTextField: UITextField!
    @IBOutlet weak var anoTextField: UITextField!
    @IBOutlet weak var btnSalvar: UIButton!
    
    @IBAction func cadastrarLivro(_ sender: UIButton) {
        let livro = Livro()
        
        livro.nome = nomeTextField.text!
        livro.autor = autorTextField.text!
        livro.ano = anoTextField.text!
        
        let isSaved = controller.salvarLivro()
        
        if(isSaved){
            fecharCadastro()
        }
    }
    
    func fecharCadastro(){
        // FECHAR FORMULÁRIO DE CADASTRO
    }
}

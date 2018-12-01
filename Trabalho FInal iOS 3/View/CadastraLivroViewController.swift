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
    var livroDetalhe = Livro()

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var autorTextField: UITextField!
    @IBOutlet weak var anoTextField: UITextField!
    @IBOutlet weak var btnSalvar: UIButton!
    
    @IBAction func cadastrarLivro(_ sender: UIButton) {
        if nomeTextField.text == "" || autorTextField.text == "" || anoTextField.text == ""{
            mostrarAlerta(title: "Alerta" , message: "Necessário preencher todos os campos!")
            return
        }
        let livro = Livro()
        
        livro.nome = nomeTextField.text!
        livro.autor = autorTextField.text!
        livro.ano = anoTextField.text!
        
        controller.salvarLivro(livro: livro,completion: {(name) -> Void in
            if name != ""{
                self.controller.buscarLivro(name: name, completion: {(livro) -> Void in
                    if(livro != nil){
                        self.livroDetalhe = livro!
                        self.nomeTextField.text = ""
                        self.autorTextField.text = ""
                        self.anoTextField.text = ""
                    }
                    
                })
//                self.fecharCadastro()
//                self.nomeTextField.text = ""
//                self.autorTextField.text = ""
//                self.anoTextField.text = ""
//
//                self.mostrarAlerta(title: "Alerta" , message: "Livro Cadastrado com Sucesso!")
            }
            
        })
    }
    
//    func fecharCadastro(){
//        // FECHAR FORMULÁRIO DE CADASTRO
//        self.performSegue(withIdentifier: "", sender: nil)
//    }
    
    func mostrarAlerta(title: String, message: String) {
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertaGuia.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertaGuia, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detalheLivroSegue1" {
//            let cell = sender as! UITableViewCell
            let destinationVC = segue.destination as! DetalhaLivroViewController
            destinationVC.livro = livroDetalhe
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

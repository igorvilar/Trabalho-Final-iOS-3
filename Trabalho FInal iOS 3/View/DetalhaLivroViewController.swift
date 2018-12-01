//
//  DetalhaLivroViewController.swift
//  Trabalho FInal iOS 3
//
//  Created by Savio Silva on 25/11/18.
//  Copyright © 2018 Igor Vilar. All rights reserved.
//

import UIKit

class DetalhaLivroViewController: UIViewController {
    
    var livro : Livro!
    let controller = LivrosController()

    @IBOutlet weak var nomeLivroLbl: UILabel!
    @IBOutlet weak var autorLivroLbl: UILabel!
    @IBOutlet weak var anoLivroLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nomeLivroLbl.text = livro.nome
        autorLivroLbl.text = livro.autor
        anoLivroLbl.text = livro.ano
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func excluirButton(_ sender: Any) {
        
        controller.excluirLivro(livro: livro,completion: {(sucesso) -> Void in
            if sucesso == true{
                self.dismiss(animated: true, completion: nil)
            }
            
        })
    }
    @IBAction func voltarButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

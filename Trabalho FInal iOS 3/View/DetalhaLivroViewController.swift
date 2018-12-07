//
//  DetalhaLivroViewController.swift
//  Trabalho FInal iOS 3
//
//  Created by Savio Silva on 25/11/18.
//  Copyright © 2018 Igor Vilar. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetalhaLivroViewController: UIViewController {
    
    var livro : Livro!
    let controller = LivrosController()

    @IBOutlet weak var nomeLivroLbl: UILabel!
    @IBOutlet weak var autorLivroLbl: UILabel!
    @IBOutlet weak var anoLivroLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Detalhes Livro"
        
        nomeLivroLbl.text = "Título: \(livro.nome)"
        autorLivroLbl.text = "Autor: \(livro.autor)"
        anoLivroLbl.text = "Ano: \(livro.ano)"
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
        SVProgressHUD.show()
        controller.excluirLivro(livro: livro,completion: {(sucesso) -> Void in
            SVProgressHUD.dismiss()
            if sucesso == true{
                self.navigationController?.popToRootViewController(animated: true)
            }
            
        })
    }

}

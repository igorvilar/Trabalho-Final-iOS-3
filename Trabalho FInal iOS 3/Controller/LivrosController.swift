//
//  LivrosController.swift
//  Trabalho FInal iOS 3
//
//  Created by Savio Silva on 25/11/18.
//  Copyright © 2018 Igor Vilar. All rights reserved.
//

import Foundation
import Alamofire

class LivrosController {
    
    func salvarLivro(livro : Livro, completion: @escaping (Bool) -> Void){
        guard let url = URL(string: "https://livros-ios3.firebaseio.com/livro.json") else {
            completion(false)
            return
        }
        
        let parameters: Parameters = ["nome": livro.nome, "autor": livro.autor, "ano": livro.ano]

        Alamofire.request(url,
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: /(String(describing: response.result.error))")
                    completion(false)
                    return
                }
                let postDict = response.value as? [String : AnyObject] ?? [:]
                let keyBook = postDict["name"] as! String 
                print(keyBook)

                completion(true)
        }
    }
    
    func buscarLivros(completion: @escaping ([Livro]?) -> Void) {
        guard let url = URL(string: "https://livros-ios3.firebaseio.com/livro.json") else {
            completion(nil)
            return
        }
        Alamofire.request(url,
                          method: .get,
                          parameters: nil)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: /(String(describing: response.result.error))")
                        completion(nil)
                    return
                }
                
                let postDict = response.value as? [String : AnyObject] ?? [:]
                var livrosLista = [Livro]()
                for key in postDict.keys{
//                    NSLog("key = \(key)")
                    let novoLivro = Livro.init(id: key, nome: postDict[key]!["nome"] as! String, autor: postDict[key]!["autor"] as! String, ano: postDict[key]!["ano"] as! String)
                    livrosLista.append(novoLivro)
                }
                completion(livrosLista)
                return
        }
    }
    
    func excluirLivro(livro : Livro, completion: @escaping (Bool) -> Void){
        NSLog("Excluindo livro: \(livro.id)")
        guard let url = URL(string: "https://livros-ios3.firebaseio.com/livro/\(livro.id).json") else {
            completion(false)
            return
        }
        
        Alamofire.request(url,
                          method: .delete,
                          encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: /(String(describing: response.result.error))")
                    completion(false)
                    return
                }
                completion(true)
                return
        }
    }
}

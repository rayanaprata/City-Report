//
//  CadastrarProblemaViewController.swift
//  City Report
//
//  Created by Rayana Prata Neves on 18/07/22.
//

import UIKit

class CadastrarProblemaViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var localizacao: UITextField!
    @IBOutlet weak var descricao: UITextField!
    @IBOutlet weak var imagem: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        backgroundView.layer.cornerRadius = 10
    }
    
    @IBAction func carregarImagem(_ sender: Any) {
        
    }
    
    @IBAction func salvar(_ sender: Any) {
        
        guard let nomeSafe = nome.text, let localizacaoSafe = localizacao.text, let descricaoSafe = descricao.text else { return }
        
        if !nomeSafe.isEmpty && !localizacaoSafe.isEmpty && !descricaoSafe.isEmpty {
            
            let context = DataBaseController.persistentContainer.viewContext
            let problema = Problema(context: context)
            problema.nome = nomeSafe
            problema.descricao = descricaoSafe
            problema.localizacao = localizacaoSafe
            DataBaseController.saveContext()
            
            self.navigationController?.popToRootViewController(animated: true)
            
        } else {
            
            print(nomeSafe, localizacaoSafe, descricaoSafe)
            
            // tratamento de erro
            // apresentar um alert informando pro usuário que todos os campos de texto devem ser preenchidos
        }
    }
}

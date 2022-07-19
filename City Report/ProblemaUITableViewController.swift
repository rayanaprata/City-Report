//
//  ProblemaUITableViewController.swift
//  City Report
//
//  Created by Rayana Prata Neves on 18/07/22.
//

import UIKit

class ProblemaUITableViewController: UITableViewController {
    
    @IBOutlet var problemaTableView: UITableView!
    var problemas: [Problema] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadTableViewProblem()
    }
    
    func reloadTableViewProblem() {
        do {
            self.problemas = try DataBaseController.persistentContainer.viewContext.fetch(Problema.fetchRequest())
        } catch {
            print("Nao consegui trazer as informaçoes do banco de dados")
        }
        self.problemaTableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problemas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "problemaTableViewCell", for: indexPath)

        let problema = problemas[indexPath.row]
        
        cell.textLabel?.text = problema.nome
        cell.detailTextLabel?.text = Date().formatted()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           let problema = problemas[indexPath.row]
           let context = DataBaseController.persistentContainer.viewContext
           if editingStyle == .delete {
               context.delete(problema)
               do {
                   try context.save()
               } catch {
                   print("Erro ao deletar problema")
               }
               tableView.deleteRows(at: [indexPath], with: .fade)
               self.problemaTableView.reloadData()
           }
       }

}

//
//  ReposViewController.swift
//  JaymeExample
//
//  Created by Pablo Villar on 3/15/17.
//  Copyright © 2017 Inaka. All rights reserved.
//

import UIKit
import Jayme
import SVProgressHUD

class ReposViewController: UIViewController {
    
    let repository = ReposRepository()
    
    @IBOutlet weak var tableView: UITableView!
    enum State {
        case initial
        case reset
        case loading
        case loaded([Repo])
        case failed(JaymeError)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.state = .reset
        self.loadRepos()
    }
    
    fileprivate func loadRepos() {
        self.state = .loading
        ReposRepository().readAll().start { result in
            switch result {
            case .success(let repos):
                self.state = .loaded(repos)
            case .failure(let error):
                self.state = .failed(error)
            }
        }
    }
    
    var state: State = .initial {
        didSet {
            switch state {
                
            case .loading:
                SVProgressHUD.show()
                
            case .loaded(_):
                SVProgressHUD.dismiss()
                self.reloadTableView()
                
            case .failed(let error):
                SVProgressHUD.dismiss()
                self.showAlert(for: error, message: "Could not retrieve user's repos")
                let _ = self.navigationController?.popViewController(animated: true)

            default:
                break
                
            }
        }
    }
    
    fileprivate func reloadTableView() {
        let indexSet = IndexSet(integer: 0)
        self.tableView.reloadSections(indexSet, with: .automatic)
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Create New Repo", message: "", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Create", style: .default, handler: {
            alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            guard let name = textField.text, name != "" else { return }
            self.createRepo(name: name)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Repo's name"
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func createRepo(name: String) {
        ReposRepository().create(name: name).start { result in
            switch result {
            case .success(_):
                self.loadRepos()
            case .failure(let error):
                self.showAlert(for: error, message: "Your repo could not be created.")
            }
        }
    }
    
}

extension ReposViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard case .loaded(let repos) = self.state else {
            return 0
        }
        return repos.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as! RepoCell
        cell.repo = self.repo(for: indexPath)
        return cell
    }
    
    fileprivate func repo(for indexPath: IndexPath) -> Repo! {
        guard case .loaded(let repos) = self.state else {
            return nil
        }
        return repos[indexPath.row]
    }
    
}

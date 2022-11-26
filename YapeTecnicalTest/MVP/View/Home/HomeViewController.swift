//
//  HomeViewController.swift
//  YapeTecnicalTest
//
//  Created by Oswaldo Escobar on 24/11/22.
//

import UIKit
import RealmSwift
class HomeViewController:  UIViewController, UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    private var recetas: [Receta] = []
    private let presenter = HomePresenter()
    private var filteredData: [Receta] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(delegate: self)
        searchBar.delegate = self
        initTableSetup()
        loadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        title = "Recetas"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.systemBackground.cgColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func initTableSetup() {
        tableView.tableHeaderView = searchBar
        tableView.register(UINib(nibName: "HomeCell", bundle: Bundle.main), forCellReuseIdentifier: "HomeCell")
    }
    
    // MARK: - User actions
    @objc func routeExit(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Data methods
    func loadData() {
        recetas.removeAll()
        self.presenter.getDataRecetas()
    }

    // MARK: - Refresh methods
    func refreshTableView() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.bindData(data: filteredData[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewData = recetas[indexPath.row]
        let vc = DetallReceta()
        vc.viewData = viewData
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: - UISearchControllerDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText.isEmpty {
            filteredData = recetas
        }
        else {
            for i in recetas {
                if i.nombre.lowercased().contains(searchText.lowercased()) || i.ingredientes.lowercased().contains(searchText.lowercased()){
                    filteredData.append(i)
                }
            }
        }
        self.tableView.reloadData()
    }
}



extension HomeViewController: HomePresenterDelegate {
    func presentGetReceta(recetas: [Receta]) {
        self.recetas = recetas
        self.filteredData = recetas
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

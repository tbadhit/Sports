//
//  ViewController.swift
//  Submission iOS Pemula
//
//  Created by Tubagus Adhitya Permana on 14/08/22.
//

import UIKit

let cellId = "SportCell"

class SportViewController: UIViewController {
    
    @IBOutlet weak var sportTableView: UITableView!
    
    private var sports: [Sport] = []
    var apiService = ApiService()
    
    private let spinner = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.setLoadingScreen(parentView: self.view)
        
        fetchSportsData { [weak self] in
            self?.sportTableView.dataSource = self
            self?.sportTableView.reloadData()
            self?.spinner.removeLoadingScreen()
        }
        
        sportTableView.delegate = self
        
        sportTableView.register(UINib(nibName: "SportTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    
    func fetchSportsData(completion: @escaping () -> ()) {
        apiService.getSportsData { [weak self] result in
            switch result {
            case .success(let listOf):
                self?.sports = listOf.sports
                completion()
            case .failure(let error):
                print("Error processing json data \(error)")
            }
        }
    }
    @IBAction func goToProfileScreen(_ sender: Any) {
        let profileScreen = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        
        self.navigationController?.pushViewController(profileScreen, animated: true)
    }
}

extension SportViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SportTableViewCell {
            let sport = sports[indexPath.row]
            cell.setCellWithValueOf(sport)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}


extension SportViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.sport = sports[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


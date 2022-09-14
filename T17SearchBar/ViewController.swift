//
//  ViewController.swift
//  T17SearchBar
//
//  Created by NeonApps on 13.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
  
    let tableView = UITableView()
    let data = ["Apple", "Banana", "Sugar"]
    var filteredData : [String]!
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
       
        tableView.backgroundColor = .gray
   
        createUI()
        
    }
    
    func createUI() {
        
        setDefaultSize(view: view)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .yellow

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        searchBar.frame = CGRect(x: 0.1 * screenWidth, y: 0.1 * screenHeight, width: 0.8 * screenWidth, height: 100)

        filteredData = data

       
        
        


        view.addSubview(searchBar)
      
        
        
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []

        if searchText == "" {
            filteredData = data
        }
        
        for word in data {
            if word.uppercased().contains(searchText) {
                filteredData.append(word)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(filteredData.count)
        
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        cell.textLabel?.textColor = .black
        return cell
        
    }
    
    
    
    


}


//
//  SearchResultsTableViewController.swift
//  Itunes Search
//
//  Created by Kevin Stewart on 1/17/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

    
        // MARK: - Properties
        var searchResultsController: SearchResultController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
    
    // MARK: - Outlets
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var selectedSegmentedIndex: UISegmentedControl!
    
    
    // MARK: - Actions
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (searchResultsController?.searchResult.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        guard indexPath.row < (searchResultsController?.searchResult.count)! else { return cell }
               let searchResult = searchResultsController?.searchResult[indexPath.row]
               cell.searchResult = searchResult

        return cell
    }
}

extension SearchResultsTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        print("Searching for \(searchTerm)...")
        switch ResultType(rawValue: searchTerm) {
        case .software:
            searchResultsController?.searchResult = searchResultsController?.searchResults
    //    case .musicTrack:
            
     //   case .movie :
    
        default:
            <#code#>
        }
        }
}


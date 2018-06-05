//
//  SearchNavigator.swift
//  TMDbCore
//
//  Created by DesarrolloMac1 on 28/05/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

final class SearchNavigator {
    private unowned let searchViewControllerProvider: SearchViewControllerProvider
    private var searchController : UISearchController!
    
    init(searchViewControllerProvider: SearchViewControllerProvider) {
        self.searchViewControllerProvider = searchViewControllerProvider
    }
    func installSearch(in viewController: UIViewController) {
        let searchViewController = searchViewControllerProvider.searchViewController()
        searchController = UISearchController(searchResultsController: searchViewController)
        
        searchController.searchResultsUpdater = searchViewController as? UISearchResultsUpdating
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search movies, shows and people", comment: "")
        searchController.searchBar.searchBarStyle = .minimal
        
        viewController.navigationItem.titleView = searchController.searchBar
        viewController.definesPresentationContext = true // para que la interfaz de busqueda no tape tod.
    }
}

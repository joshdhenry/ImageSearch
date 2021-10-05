//
//  ImagesViewController+UISearchBarDelegateExtension.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/3/21.
//

import Foundation
import UIKit

extension ImagesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search button clicked. Search for " + query)
        
        self.view.endEditing(true)
        imagesTableView.setContentOffset(.zero, animated: true)
        
        FlickrAPIService.fetchImages(page: page, query: query, completion: {(fetchSuccessful, fetchedImages) in
            self.imageData = fetchedImages
            
            //Update the table view on the main thread
            DispatchQueue.main.async {
                self.imagesTableView.reloadData()
            }
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        query = searchText
    }
}

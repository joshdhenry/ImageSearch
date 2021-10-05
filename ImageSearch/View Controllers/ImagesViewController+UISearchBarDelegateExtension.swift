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
        //Dismiss keyboard
        self.view.endEditing(true)
        
        //Scroll to top
        imagesTableView.setContentOffset(.zero, animated: true)
        
        do {
        try FlickrAPIService.fetchImages(page: page, query: query, completion: {(fetchSuccessful, fetchedImages) in
            self.imageData = fetchedImages
            
            //Update the table view on the main thread
            DispatchQueue.main.async {
                self.imagesTableView.reloadData()
            }
        })
        }
        catch ErrorTypes.apiKeyError {
            showError(errorMessage: "Unable to load the API key.")
        }
        catch ErrorTypes.apiKeyPListError {
            showError(errorMessage: "Could not access ApiKeys.plist.")
        }
        catch ErrorTypes.queryMissingError {
            showError(errorMessage: "Please enter a valid search term.")
        }
        catch {
            showError(errorMessage: "An error has occurred.")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        query = searchText
    }
}

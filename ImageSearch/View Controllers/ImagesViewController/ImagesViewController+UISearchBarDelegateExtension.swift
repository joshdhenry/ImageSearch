//
//  ImagesViewController+UISearchBarDelegateExtension.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/3/21.
//

import Foundation
import UIKit

extension ImagesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        query = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {        
        //Dismiss keyboard
        self.view.endEditing(true)
        
        //Scroll to top
        imagesTableView.setContentOffset(.zero, animated: true)
        
        do {
        try FlickrAPIService.fetchImages(page: page, query: query, completion: {(fetchSuccessful, fetchedImages) in
            self.imageData = fetchedImages
            
            //Update the table view UI on the main thread
            DispatchQueue.main.async {
                self.imagesTableView.reloadData()
            }
        })
        }
        catch ErrorTypes.apiKeyError {
            self.showAlert(message: "Unable to load the API key.")
        }
        catch ErrorTypes.apiKeyPListError {
            self.showAlert(message: "Could not access ApiKeys.plist.")
        }
        catch ErrorTypes.queryMissingError {
            self.showAlert(message: "Please enter a valid search term.")
        }
        catch {
            self.showAlert(message: "An error has occurred.")
        }
    }
}

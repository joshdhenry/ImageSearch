//
//  ImagesViewController+UITableViewDelegateExtension.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/3/21.
//

import Foundation
import UIKit

extension ImagesViewController: UITableViewDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let imageSegue: String = "imageSegue"
        
        if segue.identifier == imageSegue {
            let secondViewController =  segue.destination as! ImageViewController
            secondViewController.newImage = selectedImage
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ImageTableViewCell
        else {
            return
        }
        
        selectedImage = cell.imageImageView.image
        
        performSegue(withIdentifier: "imageSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let didScrollToEnd = indexPath.row + 1 == imageData.count
        
        if didScrollToEnd {
            page += 1
            do {
                try FlickrAPIService.fetchImages(page: page, query: query, completion: {(fetchSuccessful, fetchedImages) in
                self.imageData.append(contentsOf: fetchedImages)
                
                //Update the table view on the main thread
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
}



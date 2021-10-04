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
        if segue.identifier == "imageSegue" {
            print("In there")
            print(selectedImage)

            let secondViewController =  segue.destination as! ImageViewController
            secondViewController.newImage = selectedImage
            secondViewController.newText = "Can you see?"
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row ", indexPath)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? ImageTableViewCell
        else{
            return
        }
        
        print("Setting selected image")
        print(cell.imageImageView.image)
        selectedImage = cell.imageImageView.image
    }
}



//
//  ImagesViewController+UITableViewDataSourceExtension.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/3/21.
//

import Foundation
import UIKit

extension ImagesViewController: UITableViewDataSource {    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
        let hasData = imageData.count > 0
        
        if hasData {
            let flickrUrl = FlickrAPIService.getImageUrl(server: imageData[indexPath.row].server, id: imageData[indexPath.row].id, secret: imageData[indexPath.row].secret)
            
            if let url = URL(string: flickrUrl) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async { /// execute on main thread
                        cell.imageImageView.image = UIImage(data: data)
                        self.rowCompletions[indexPath.row] = true
                        if (self.rowCompletions.count > 7 && self.didReload == false) {
                            self.didReload = true
                            self.imagesTableView.reloadData()
                        }
                    }
                }
                task.resume()
            }
        }
        return cell
    }
}

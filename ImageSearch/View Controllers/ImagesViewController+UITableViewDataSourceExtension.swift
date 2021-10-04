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
            print(imageData[0])
            print(imageData[0].id)
//            cell.textLabel?.text = data2[indexPath.row].id
            
            let flickrUrl = FlickrAPIService.getImageUrl(server: imageData[indexPath.row].server, id: imageData[indexPath.row].id, secret: imageData[indexPath.row].secret)
            print(flickrUrl)
            
            if let url = URL(string: flickrUrl) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async { /// execute on main thread
//                        cell.textLabel?.text = self.data2[indexPath.row].id
                        cell.imageLabel.text = self.imageData[indexPath.row].id
                        print(data)
                        cell.imageImageView.image = UIImage(data: data)
//                        self.imagesTableView.reloadData()
                    }
                }
                
                task.resume()
            }
                        
//            cell.imageLabel = data2[indexPath.row].id
            

        }

        return cell
    }
}

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
        let identifier: String = "imageCell"
        let cell: ImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ImageTableViewCell
        let hasData: Bool = imageData.count > 0
        
        if hasData {
            let row: Int = indexPath.row
            let imageDataForRow = imageData[row]
            let urlString: String = FlickrAPIService.getImageUrl(server: imageDataForRow.server, id: imageDataForRow.id, secret: imageDataForRow.secret)
            
            if let url = URL(string: urlString) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async { // execute on main thread
                        cell.imageImageView.image = UIImage(data: data)
                        self.rowCompletions[row] = true
                        let numOfRowCompletions: Int = self.rowCompletions.count
                        let shouldReload: Bool = numOfRowCompletions > 10
                        
                        if (shouldReload && !self.didReload) {
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

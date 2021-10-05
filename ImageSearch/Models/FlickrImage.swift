//
//  FlickrURLs.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/5/21.
//

import Foundation

struct FlickrImage: Codable {
    let id : String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
}

//
//  Image.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/2/21.
//

import Foundation

struct FlickrImageResult: Codable {
    let photos : FlickrPagedImageResult?
    let stat: String
}

struct FlickrPagedImageResult: Codable {
    let photo : [FlickrURLs]
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
}

struct FlickrURLs: Codable {
    let id : String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    // let title: String
    // If needed, camel-case and use CodingKeys enum
    //let ispublic: Int
    //let isfriend: Int
    //let isfamily: Int
}

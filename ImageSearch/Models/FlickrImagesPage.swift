//
//  FlickrPagedImageResult.swift
//  ImageSearch
//
//  Created by Josh Henry on 10/5/21.
//

import Foundation

struct FlickrImagesPage: Codable {
    let photo : [FlickrImage]
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
}

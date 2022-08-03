//
//  FlickrImagesM.swift
//  Flickr
//
//  Created by mac on 8/3/22.
//



import Foundation

// MARK: - Welcome
class Welcome: Codable {
    let photos: Photos
    let stat: String

    init(photos: Photos, stat: String) {
        self.photos = photos
        self.stat = stat
    }
}
typealias welcome = [Welcome]


// MARK: - Photos
class Photos: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]

    init(page: Int, pages: Int, perpage: Int, total: Int, photo: [Photo]) {
        self.page = page
        self.pages = pages
        self.perpage = perpage
        self.total = total
        self.photo = photo
    }
}

// MARK: - Photo
class Photo: Codable {
    let id: String
    let owner: Owner
    let secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    let urlM: String
    let heightM, widthM: Int

    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily
        case urlM = "url_m"
        case heightM = "height_m"
        case widthM = "width_m"
    }

    init(id: String, owner: Owner, secret: String, server: String, farm: Int, title: String, ispublic: Int, isfriend: Int, isfamily: Int, urlM: String, heightM: Int, widthM: Int) {
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.ispublic = ispublic
        self.isfriend = isfriend
        self.isfamily = isfamily
        self.urlM = urlM
        self.heightM = heightM
        self.widthM = widthM
    }
}


enum Owner: String, Codable {
    case the11851864N06 = "11851864@N06"
    case the66919430N00 = "66919430@N00"
}

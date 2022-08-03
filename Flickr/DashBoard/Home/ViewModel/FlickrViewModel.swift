//
//  FlickrViewModel.swift
//  Flickr
//
//  Created by mac on 8/3/22.
//

import Foundation
import UIKit
import Alamofire

class FlickrViewModel: BaseVM {
    
    private var page = 0
    private var per_page = 25

    private var responseModel: welcome
    private var photoList: [Photo] = []
    init(model: welcome = welcome()) {
        responseModel = model
    }
    
    func getPhotos() {
        setState(.loading)
        Spinner.start()
        
        let url = "\(AppConstants.baseURL)?page=\(page)&method=flickr.photos.search&format=json&lon=103.7940514843148&api_key=\(AppConstants.APIkey)&per_page=\(per_page)&lat=1.411935988414726&extras=url_m&nojsoncallback=1"

        AF.request(url, method: .get).responseDecodable(of: Welcome.self) {(response) in
            Spinner.stop()
            if let res = response.value{
                let images = res.photos.photo
                self.photoList.append(contentsOf: images)
                self.page += 1
                self.setState(.success)
            }else{
                self.setState(.error)
            }
        }
    }

    var numberOfRows: Int {
        return photoList.count
    }

    func bookItemViewModelAtIndex(_ index: Int) -> [Photo]? {
        return photoList
    }
    func photoAtIndex(_ index: Int) -> Photo {
        return photoList[index]
    }
    
    var isEmpty: Bool {
        return !(photoList.count > 0)
    }
}

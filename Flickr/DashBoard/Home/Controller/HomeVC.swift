//
//  HomeVC.swift
//  Flickr
//

import UIKit

// MARK: - IBOutlets
// MARK: - Properties
// MARK: - Lifecycle Methods
// MARK: - Private Method
// MARK: - Actions
// MARK:-  DataSource&Delegate
// MARK:-  Extentions

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    // MARK: - IBOutlets

    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "FlipImageCVCell", bundle: nil), forCellWithReuseIdentifier: "FlipImageCVCell")
        }
    }
    // MARK: - Properties
    private var disposal = Disposal()
    private var flickrViewModel = FlickrViewModel()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        bindUI()
        flickrViewModel.getPhotos()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    

    // MARK: - Private Method
    private func bindUI() {
        flickrViewModel.state.observe { [weak self] (state) in
            guard let self = self else { return }
            switch state {
            case .success:
                self.updateUI()
            case .error:
                self.flickrViewModel.getPhotos()
            default:
                break
            }
        }.add(to: &disposal)
    }
    
    private func updateUI() {
        collectionView.reloadData()
    }
    
    
    // MARK:-  DataSource&Delegate

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flickrViewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlipImageCVCell", for: indexPath as IndexPath) as! FlipImageCVCell
        let photo = flickrViewModel.photoAtIndex(indexPath.row)
        cell.image.setImage(urlStr: photo.urlM)
        cell.imageTitle.text = photo.title
        cell.imageSize.text = "H*W: \(photo.widthM)*\(photo.heightM)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at:indexPath) as? FlipImageCVCell else { return }
        cell.flip()
        }
       
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (flickrViewModel.numberOfRows - 1) {
            flickrViewModel.getPhotos()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width ) / 3
        return CGSize(width: width, height: width)
    }
    
    
}

//
//  CategoriesViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 12/04/24.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var collectionViewCategories: UICollectionView!
    @IBOutlet weak var collectionViewSpecialMenu: UICollectionView!
    
    let CategoriesCollectionViewCell = "cellCategorie"
    let SpecialMenuCollectionViewCell = "cellSpecial"
    
    
    //MARK: - images from popular categories
    var images: [String] = ["imagePizza", "imageSalad", "imageBurguer","imagePizza", "imageSalad", "imageBurguer"]
    
    //MARK: - image, label and BgColor from special Menu

    var imagesSpecialMenu: [String] = ["imageTaco", "imageBurguerClub","imageTaco", "imageBurguerClub"]
    var labelSpecial: [String] = ["The Taco Company", "The Burguer Club","The Taco Company", "The Burguer Club"]
    var coresBGMenu: [String] = ["BgIconSalad","purpleBgMenu","BgIconBurguer","purpleBgMenu"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewCategories.delegate = self
        collectionViewCategories.dataSource = self
        
        collectionViewSpecialMenu.delegate = self
        collectionViewSpecialMenu.dataSource = self

        // Do any additional setup after loading the view.
    }

    
    //MARK: - Removing the button "back" from Home

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}


//MARK: - Adding two CollectionViews in one ViewController
extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewCategories{
            return images.count
        } else if collectionView == self.collectionViewSpecialMenu{
            return imagesSpecialMenu.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewCategories{
            let cellCategories = collectionViewCategories.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell, for: indexPath) as! CategoriesCollectionViewCell
            
            cellCategories.iconCategorie.image = UIImage(named: images[indexPath.row])
            return cellCategories
            
        }else if collectionView == self.collectionViewSpecialMenu{
            let cellSpecial = collectionViewSpecialMenu.dequeueReusableCell(withReuseIdentifier: SpecialMenuCollectionViewCell, for: indexPath) as! SpecialMenuCollectionViewCell
            
            cellSpecial.imageFood.image = UIImage(named: imagesSpecialMenu[indexPath.row])
            cellSpecial.labelFood.text = labelSpecial[indexPath.row]
            //cellSpecial.viewSpecialMenu.tintColor = UIColor(named: coresBGMenu[indexPath.row])
            cellSpecial.viewSpecialMenu.backgroundColor = UIColor(named: coresBGMenu[indexPath.row])
            
            return cellSpecial

        }
        return UICollectionViewCell()
    }
    

    
    
}


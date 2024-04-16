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
    @IBOutlet weak var collectionViewFeatured: UICollectionView!
    
    
    let CategoriesCollectionViewCell = "cellCategorie"
    let SpecialMenuCollectionViewCell = "cellSpecial"
    let FeaturedCollectionViewCell = "cellFeatured"
    
    
    //MARK: - images from popular categories
    var images: [String] = ["imagePizza", "imageSalad", "imageBurguer","imagePizza", "imageSalad", "imageBurguer"]
    
    //MARK: - image, label and BgColor from special Menu

    var imagesSpecialMenu: [String] = ["imageTaco", "imageBurguerClub","imageTaco", "imageBurguerClub"]
    var FoodsName: [String] = ["The Taco Company", "The Burguer Club", "The Taco Campany", "The Burguer Club"]
    var bgSpecialMenu: [String] = ["BgIconPizza", "purpleBgMenu","BgIconPizza", "purpleBgMenu"]
    var countryFood: [String] = ["Mexican", "American", "Mexican", "American"]
    
    //MARK: - Image Featured restaurants
    
    var imagesFeatured: [String] = ["chickenImage", "chickenImage","chickenImage", "chickenImage"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewCategories.delegate = self
        collectionViewCategories.dataSource = self
        
        collectionViewSpecialMenu.delegate = self
        collectionViewSpecialMenu.dataSource = self
        
        collectionViewFeatured.delegate = self
        collectionViewFeatured.dataSource = self
        
        

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
        }else if collectionView == self.collectionViewFeatured{
            return imagesFeatured.count
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
            cellSpecial.labelFood.text = FoodsName[indexPath.row]
            cellSpecial.labelCountry.text = countryFood[indexPath.row]
            cellSpecial.viewSpecialMenu.backgroundColor = UIColor(named: bgSpecialMenu[indexPath.row])
            
            return cellSpecial
            
        }else if collectionView == self.collectionViewFeatured{
            let cellFeatured = collectionViewFeatured.dequeueReusableCell(withReuseIdentifier: FeaturedCollectionViewCell, for: indexPath) as! FeaturedCollectionViewCell
            
            cellFeatured.imageFeatured.image = UIImage(named: imagesFeatured[indexPath.row])
            
            return cellFeatured

        }
        return UICollectionViewCell()
    }
    
    
    
    
    
    
}

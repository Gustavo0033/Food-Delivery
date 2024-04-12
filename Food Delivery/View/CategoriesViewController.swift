//
//  CategoriesViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 12/04/24.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var collectionViewCategories: UICollectionView!
    
    var images: [String] = ["imagePizza", "imageSalad", "imageBurguer","imagePizza", "imageSalad", "imageBurguer"]
    //var bgIcons: [String] = ["BgIconPizza", "BgIconSalad", "BgIconBurguer", "BgIconPizza", "BgIconSalad", "BgIconBurguer"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCollectionViewCell
        
        cell.iconCategorie.image = UIImage(named: images[indexPath.row])
       
       // cell.back = UIColor(named: bgIcons[indexPath.row])
        return cell
    }
    
    
}

//
//  FoodCategoryViewController.swift
//  Food Delivery
//
//  Created by Gustavo Mendonca on 12/04/24.
//

import UIKit

class FoodCategoryViewController: UIViewController {
    
    var cardFood: [String] = ["cardPizza", "cardTaco", "cardChinese", "cardChicken","cardPizza", "cardTaco", "cardChinese", "cardChicken"]
    
    
    @IBOutlet weak var collectionFoodCategory: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }


}

extension FoodCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FoodCategoryCollectionViewCell
        
        cell.iimageCard.image = UIImage(named: cardFood[indexPath.row])
        
        return cell
    }
    


    
    
}

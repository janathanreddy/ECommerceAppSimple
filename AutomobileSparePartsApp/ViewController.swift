//
//  ViewController.swift
//  AutomobileSparePartsApp
//
//  Created by Janarthan Subburaj on 18/01/21.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imagename:[UIImage] = [#imageLiteral(resourceName: "seat"),#imageLiteral(resourceName: "tyres"),#imageLiteral(resourceName: "CarTopCarrier")]
    var brandImage:[UIImage] = [#imageLiteral(resourceName: "Ford"),#imageLiteral(resourceName: "Maruti"),#imageLiteral(resourceName: "Tata-Motors"),#imageLiteral(resourceName: "honda"),#imageLiteral(resourceName: "Skoda"),#imageLiteral(resourceName: "Wagan"),#imageLiteral(resourceName: "mahendra"),#imageLiteral(resourceName: "Renault_logo"),#imageLiteral(resourceName: "Nissan"),#imageLiteral(resourceName: "toyota-logo-4457"),#imageLiteral(resourceName: "Hyundai")]
    var Cells:[String] = ["CollectionViewCell1","BrandCollectionViewCell"]
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "CollectionViewCell1", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell1")
        
        collectionView.register(UINib(nibName: "BrandCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BrandCollectionViewCell")

        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            
            case 0: return self.firstLayoutSection()
            default: return self.secondLayoutSection()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        
        case 0:
            return imagename.count
        default:
            return brandImage.count
    }
    }
    func firstLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalWidth(0.5))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
       
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPaging
        
        
        return section
    }
    func secondLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(100))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 15, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 15
        
       
        return section
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if Cells[indexPath.section] == "CollectionViewCell1"{
            let CollectionViewCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell1", for: indexPath) as! CollectionViewCell1
            CollectionViewCell1.images.image = imagename[indexPath.row]
            CollectionViewCell1.images.layer.borderWidth = 1
            CollectionViewCell1.images.layer.cornerRadius = 20
            CollectionViewCell1.images.layer.cornerCurve = .continuous
            CollectionViewCell1.images.layer.borderColor = UIColor.systemGray4.cgColor
            return CollectionViewCell1
            
        }else{
            let BrandCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCollectionViewCell", for: indexPath) as! BrandCollectionViewCell
            BrandCollectionViewCell.images.image = brandImage[indexPath.row]
            BrandCollectionViewCell.images.layer.borderWidth = 1
            BrandCollectionViewCell.images.layer.borderColor = UIColor.systemGray3.cgColor
            BrandCollectionViewCell.backgroundColor = UIColor.systemGray6
            


            return BrandCollectionViewCell
        }
        return UICollectionViewCell()
    }
    
    

}



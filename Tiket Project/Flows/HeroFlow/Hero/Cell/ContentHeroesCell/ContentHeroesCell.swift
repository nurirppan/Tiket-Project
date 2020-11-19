//
//  ContentHeroesCell.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import UIKit
import Kingfisher

class ContentHeroesCell: UICollectionViewCell {

    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var titleHero: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var models: HeroesModels! {
        didSet {
            self.titleHero.text = models.nameOfHero
            self.imageHero.kf.setImage(with: models.imageOfHero)
        }
    }
    
    var highHeroByAttr: HeroStatusModel! {
        didSet {
            self.titleHero.text = highHeroByAttr.localizedName
            self.imageHero.kf.setImage(with: URL(string: "\(HTTPClient.init().baseUrlImageDota)\(highHeroByAttr.img)"))
        }
    }

}

//
//  HeroDetailVC.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import RxSwift
import RxCocoa
import Kingfisher
import SVProgressHUD

class HeroDetailVC: UIViewController, HeroDetailView {
    
    @IBOutlet weak var imageOfHero: UIImageView!
    @IBOutlet weak var nameOfHero: UILabel!
    @IBOutlet weak var imageAttrOfHero: UIImageView!
    @IBOutlet weak var roleOfHero: UILabel!
    @IBOutlet weak var scoreAttackOfHero: UILabel!
    @IBOutlet weak var scoreHealthOfHero: UILabel!
    @IBOutlet weak var scoreDefendOfHero: UILabel!
    @IBOutlet weak var scoreSpeedOfHero: UILabel!
    @IBOutlet weak var primaryAttrOfHero: UILabel!
    @IBOutlet weak var scoreManaOfHero: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var id: Int?
    var model: [HeroStatusResponse] = []
    
    var viewModel: HeroDetailVM!
    
    private let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setUIs()
        self.setDelegates()
        self.bindCollectionView()
        self.inputViewModel()
        self.outputViewModel()

    }
    
    private func setUIs() {
        
    }
    
    private func setDelegates() {
        self.collectionView.rx.setDelegate(self).disposed(by: self.dispose)
    }
    
    private func inputViewModel() {
        self.viewModel.fetchHeroDetail(id: self.id ?? 0, model: self.model)
    }
    
    private func outputViewModel() {
        let output = self.viewModel.transform()
        
        output.outModel.drive(onNext: { (result) in
            self.navigationItem.title = result?.attackType ?? ""
            
            self.nameOfHero.text = result?.localizedName
            self.imageOfHero.kf.setImage(with: URL(string: "\(HTTPClient.init().baseUrlImageDota)\(result!.img)"))
            
            switch result?.primaryAttr {
            case "int":
                self.imageAttrOfHero.image = UIImage(named: "img_intellegence")
            case "str":
                self.imageAttrOfHero.image = UIImage(named: "img_strength")
            case "agi":
                self.imageAttrOfHero.image = UIImage(named: "img_agility")
            default :
                self.imageAttrOfHero.image = UIImage(named: "img_agility")
                
            }
            
            self.roleOfHero.text = result?.roles.joined(separator: ", ")
            self.scoreAttackOfHero.text = "\(result?.baseAttackMin ?? 0) - \(result?.baseAttackMax ?? 0)"
            self.scoreHealthOfHero.text = "\(result?.baseHealth ?? 0)"
            self.scoreDefendOfHero.text = "\(result?.baseArmor ?? 0)"
            self.scoreSpeedOfHero.text = "\(result?.moveSpeed ?? 0)"
            self.primaryAttrOfHero.text = result?.primaryAttr ?? ""
            self.scoreManaOfHero.text = "\(result?.baseMana ?? 0)"
        }).disposed(by: self.dispose)
    }
}


extension HeroDetailVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
    func bindCollectionView() {
        self.collectionView.register(UINib(nibName: "ContentHeroesCell", bundle: nil), forCellWithReuseIdentifier: "cellId")
        
        self.viewModel.relayTempSameAttributeHero.bind(to: self.collectionView.rx.items(cellIdentifier: "cellId", cellType: ContentHeroesCell.self)) {
            (row, item, cell) in
            cell.highHeroByAttr = item
        }.disposed(by: self.dispose)
        
    }
    
}

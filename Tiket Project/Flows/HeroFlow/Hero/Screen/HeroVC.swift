//
//  HeroVC.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import RxCocoa
import RxSwift

class HeroVC: UIViewController, HeroView {
    
    var viewModel: HeroVM!
    var onHeroDetailTapped: ((Int, [HeroStatusResponse]) -> Void)?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var heroModels: [HeroesModels] = []
    private var heroStatusResponse: [HeroStatusResponse] = []
    private var lastSelectedRoleHero = "All"
    
    private let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUIs()
        self.setDelegates()
        self.setTargetAction()
        self.bindTableView()
        self.bindCollectionView()
        self.inputViewModel()
        self.outputViewModel()
    }
    
    private func setUIs() {
        self.navigationItem.title = "All"
    }
    
    private func setDelegates() {
        self.tableView.rx.setDelegate(self).disposed(by: self.dispose)
        self.collectionView.rx.setDelegate(self).disposed(by: self.dispose)
    }
    
    private func setTargetAction() { }
    
    private func inputViewModel() {
        if checkConnection() {
            self.viewModel.fetchHeroStatusApi()
        }
    }
    
    private func outputViewModel() {
        let output = self.viewModel.transform()
        
        output.outHeroStatusResponse.drive(onNext: { (relayHeroStatusResponse) in
            self.heroStatusResponse = relayHeroStatusResponse
        }).disposed(by: self.dispose)
    }
    
    
    private func checkConnection() -> Bool {
        if !HTTPReachability.isConnectedToNetwork() {
            showAlert(title: "Koneksi Internet Terputus")
            return false
        }
        return true
    }
    
    
    
}

extension HeroVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (self.collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size + 30)
    }
    
    func bindCollectionView() {
        self.collectionView.register(UINib(nibName: "ContentHeroesCell", bundle: nil), forCellWithReuseIdentifier: "cellId")
        
        self.viewModel.relayHeroModels.bind(to: self.collectionView.rx.items(cellIdentifier: "cellId", cellType: ContentHeroesCell.self)) {
            (row, item, cell) in
            cell.models = item
        }.disposed(by: self.dispose)

        self.collectionView.rx.modelSelected(HeroesModels.self).subscribe(onNext: { item in
            self.onHeroDetailTapped?(item.id ,self.heroStatusResponse)
        }).disposed(by: self.dispose)
    }
    
}

extension HeroVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func bindTableView() {
        self.tableView.register(UINib(nibName: "ButtonTitleCell", bundle: nil), forCellReuseIdentifier: "cellId")

        self.viewModel.relayHeroStatusModels.bind(to: tableView.rx.items(cellIdentifier: "cellId", cellType: ButtonTitleCell.self)) { (row, item, cell) in
            cell.selectionStyle = .none
            cell.models = item
        }.disposed(by: self.dispose)

        self.tableView.rx.modelSelected(String.self).subscribe(onNext: { item in
            if self.lastSelectedRoleHero != item {
                self.lastSelectedRoleHero = item
                self.viewModel.fetchHeroByRole(role: item)
            }
        }).disposed(by: self.dispose)
    }
}

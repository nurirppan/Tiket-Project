//
//  HeroCoordinator.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

final class HeroCoordinator: BaseCoordinator, HeroCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: ModuleFactory
    private let viewModel: ViewModelFactoryImp
    private let router: Router
    
    init(router: Router, factory: ModuleFactory, viewModel: ViewModelFactoryImp) {
        self.router = router
        self.factory = factory
        self.viewModel = viewModel
    }
    
    override func start() {
        self.showHeroScreen()
    }
    
    private func showHeroScreen() {
        let view = factory.makeHeroOutput()
        view.viewModel = self.viewModel.makeHeroVM()
        view.onHeroDetailTapped = { [weak self] (id, model) in
            guard let self = self else { return }
            self.showHeroDetailScreen(id: id, model: model)
        }
        router.setRootModule(view)
    }
    
    private func showHeroDetailScreen(id: Int, model: [HeroStatusResponse]) {
        let view = factory.makeHeroDetailOutput()
        view.id = id
        view.model = model
        view.viewModel = self.viewModel.makeHeroDetailVM()
        
        router.push(view)
    }
    
    
}

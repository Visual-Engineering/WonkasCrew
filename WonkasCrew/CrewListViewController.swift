//
//  ViewController.swift
//  WonkasCrew
//
//  Created by Jordi Serra i Font on 30/4/17.
//  Copyright © 2017 kudai. All rights reserved.
//

import BSWInterfaceKit
import WonkaKit

class CrewListFactory {
    public static func crewListViewController() -> CrewListViewController {
        let vc = CrewListViewController()
        vc.interactor = CrewInteractor(apiClient: APIClient.client)
        return vc
    }
}

class CrewListViewController: UIViewController {
    
    private enum Constants {
        static let cellHeight: CGFloat = 80
    }
    
    var dataSource: CollectionViewStatefulDataSource<OompaLoompaCell>!
    var collectionView: UICollectionView!
    var interactor: CrewInteractorType!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Oompa Loompa Crew"
        
        view.backgroundColor = .white
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(
            width: self.view.frame.width,
            height: Constants.cellHeight)
        
        self.collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout)
        self.collectionView.backgroundColor = .clear
        
        self.dataSource = CollectionViewStatefulDataSource<OompaLoompaCell>(
            state: .loading,
            collectionView: collectionView,
            listPresenter: self)
        
        collectionView.dataSource = self.dataSource
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        
        interactor.retrieveCrew(maxNumber: 10).upon(.main) { (result) in
            switch result {
            case .success(let viewModel):
                self.configureFor(viewModel: viewModel)
            case .failure:
                //TODO: show error
                break
            }
        }
    }
}

extension CrewListViewController: ViewModelConfigurable {
    func configureFor(viewModel: CrewViewModel) {
        self.dataSource.updateState(.loaded(data: viewModel.crew))
    }
}

extension CrewListViewController: ListStatePresenter {
    func errorConfiguration(forError error: Error) -> ErrorListConfiguration {
        return ErrorListConfiguration.default(ActionableListConfiguration.init(title:
            NSAttributedString(string: "There has been an error")
        ))
    }
}

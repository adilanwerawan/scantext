//
//  ScanTextBuilder.swift
//  scantext
//
//  Created by MacBook on 02/04/2022.
//

import Foundation

class ScanTextBuilder {

    class func buildModule(arroundView view:ScanTextViewProtocol) {
        
        //MARK: Initialise components.
        let presenter = ScanTextPresenter()
        let interactor = ScanTextInteractor(withDataWorker: ScanTextDataWorker())
        let router = ScanTextRouter()
        
        //MARK: link VIP components.
//        view.presenter = presenter
        view.interactor = interactor
        view.wireframe = router
        presenter.view = view
        interactor.presenter = presenter
    }
}

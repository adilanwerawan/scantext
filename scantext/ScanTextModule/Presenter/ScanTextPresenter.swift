//
//  ScanTextPresenter.swift
//  scantext
//
//  Created by MacBook on 02/04/2022.
//

import Foundation
/// ScanText Module Presenter Protocol
protocol ScanTextPresenterProtocol : AnyObject {
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: ScanTextInteractorProtocol, didFetch object: ScanTextEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: ScanTextInteractorProtocol, didFailWith error: Error)
}

/// ScanText View Model
struct ScanTextViewModel {
    let formattedScannedText: String
}

/// ScanText Module Presenter
class ScanTextPresenter {
    weak var view: ScanTextViewProtocol?
    var interactor: ScanTextInteractorProtocol?
}

// MARK: - extending CandyPresenter to implement it's protocol
extension ScanTextPresenter: ScanTextPresenterProtocol {
    
    // MARK: - implement UI action handler
    func interactor(_ interactor: ScanTextInteractorProtocol, didFetch object: ScanTextEntity) {
        
        let scanTextViewModel = ScanTextViewModel(formattedScannedText: object.scannedText)
        view?.set(viewModel: scanTextViewModel)
    }
    
    func interactor(_ interactor: ScanTextInteractorProtocol, didFailWith error: Error) {
        // Manage fetch failure
    }
}

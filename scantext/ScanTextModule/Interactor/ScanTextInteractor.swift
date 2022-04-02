//
//  ScanTextInteractor.swift
//  scantext
//
//  Created by MacBook on 02/04/2022.
//

import Foundation
import TextScanSDK
/// ScanText Module Interactor Protocol
protocol ScanTextInteractorProtocol: CameraTextResultDelegate{
    // Fetch Scan Entity from Data Layer
    func fetchScannedText()
}

/// ScanText Module Interactor
class ScanTextInteractor: ScanTextInteractorProtocol {
    
    private static let vat:Float = 6.5
    private var scanTextEntity:ScanTextEntity!
    private let dataWorker: ScanTextDataWorkerProtocol

    var presenter: ScanTextPresenterProtocol?

    required init(withDataWorker dataWorker:ScanTextDataWorkerProtocol) {
        self.dataWorker = dataWorker
    }
    
    func fetchScannedText() {
        dataWorker.fetchScanText { [unowned self] (scanTextEntity) in
            self.scanTextEntity = scanTextEntity
        }
    }
    
    func getResultFromCamera(_ text: String?, _ error: Error?) {
        if let scannedText = text{
            self.scanTextEntity = ScanTextEntity(scannedText: scannedText)
            self.presenter?.interactor(self, didFetch: scanTextEntity)
        }
    }
    
    func getScannedTextEntity() -> ScanTextEntity?{
        if scanTextEntity != nil{
            return scanTextEntity
        }
        return nil
    }
}

//
//  ScanDataWorker.swift
//  scantext
//
//  Created by MacBook on 02/04/2022.
//

import Foundation

protocol ScanTextDataWorkerProtocol {
    func fetchScanText(callBack:(ScanTextEntity) -> Void)
}

class ScanTextDataWorker : ScanTextDataWorkerProtocol {

    func fetchScanText(callBack:(ScanTextEntity) -> Void) {
        let scanTextEntity = ScanTextEntity(scannedText: "")
        callBack(scanTextEntity)
    }
}

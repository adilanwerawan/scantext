//
//  ScanTextRouter.swift
//  scantext
//
//  Created by MacBook on 02/04/2022.
//

import UIKit
import TextScanSDK

protocol ScanTextRouterProtocol {
    func launchSDKTextScannerView(onView:UIViewController, delegate:CameraTextResultDelegate)
}

/// ScanText Module Router (aka: Wireframe)
class ScanTextRouter: ScanTextRouterProtocol {
    let textScanVC = TextScanner()
    func launchSDKTextScannerView(onView: UIViewController, delegate: CameraTextResultDelegate) {
        textScanVC.getScannedText(presentOnView: onView, callBackDelegate: delegate)
    }
}

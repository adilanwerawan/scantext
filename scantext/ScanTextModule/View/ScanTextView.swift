//
//  ScanTextView.swift
//  scantext
//
//  Created by MacBook on 02/04/2022.
//

import Foundation
import UIKit
import Vision
import TextScanSDK

/// Scan Module View Protocol
protocol ScanTextViewProtocol: AnyObject {
    //    var presenter: ScanPresenterProtocol? { get set }
    var interactor: ScanTextInteractorProtocol? { get set }
    var wireframe: ScanTextRouterProtocol? { get set }
    
    // Update UI with value returned.
    /// Set the view Object of Type ScanTextEntity
    func set(viewModel: ScanTextViewModel)
}

class ScanTextView: UIViewController {
    
    @IBOutlet var scannedTextView: UITextView!
    var interactor: ScanTextInteractorProtocol?
    var wireframe: ScanTextRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Scaning Text"
    }
    
    @IBAction func scanTheText(_ sender: Any) {
        if let interactor = self.interactor{
            self.wireframe?.launchSDKTextScannerView(onView: self, delegate: interactor)
        }
    }
}

extension ScanTextView: ScanTextViewProtocol{
    
    func set(viewModel: ScanTextViewModel) {
        scannedTextView.text = viewModel.formattedScannedText
    }
}

//
//  ViewController.swift
//  scantext
//
//  Created by MacBook on 31/03/2022.
//

import UIKit
import Vision
import TextScanSDK

class MyTextScanViewController: UIViewController {
    @IBOutlet var scannedTextView: UITextView!
    var recognizedText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func scanTheText(_ sender: Any) {
        let textScanVC = TextScanner()
        textScanVC.getScannedText(presentOnView: self, resultView: scannedTextView, callBackDelegate: self)
    }
}

extension MyTextScanViewController:CameraTextResultDelegate{
    func getResultFromCamera(_ request: VNRequest?, _ error: Error?) {
        
    }
}

//
//  ViewController.swift
//  AuthenticationExample
//
//  Created by Julian de Haas on 08/12/2022.
//  Copyright © 2022 Firebase. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    
     var webView: WKWebView!
     
     override func loadView() {
         let webConfiguration = WKWebViewConfiguration()
         webView = WKWebView(frame: .zero, configuration: webConfiguration)
         webView.uiDelegate = self
         view = webView
     }

     override func viewDidLoad() {
         super.viewDidLoad()
         
         let myURL = URL(string:"https://www.apple.com")
         let myRequest = URLRequest(url: myURL!)
         webView.load(myRequest)
     }
 }

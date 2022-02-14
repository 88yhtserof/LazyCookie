//
//  LoadGithubViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2022/02/14.
//

import UIKit
import WebKit

class LoadGithubViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        loadGithub()
    }
    
    func loadGithub() {
        guard let githubUrl = URL(string: "https://github.com/88yhtserof") else {return}
        let urlRequest = URLRequest(url: githubUrl)
        webView.load(urlRequest)
    }
}

extension LoadGithubViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
    }
}

//
//  DKProgressHUD.swift
//  DKProgressHUD
//
//  Created by kuzindmitry on 28.08.17.
//  Copyright © 2017 Dmitry Kuzin. All rights reserved.
//

import Foundation
import UIKit

class KDProgressHUD: UIView {
    
    private var label: UILabel!
    private var activity: UIActivityIndicatorView!
    
    func setTitle(_ title: String?) {
        label.text = title
    }
    
    init() {
        super.init(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 50, y: UIScreen.main.bounds.size.height / 2 - 50, width: 100, height: 100))
        
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        layer.cornerRadius = 8
        
        activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.frame = CGRect(x: 32, y: 20, width: 37, height: 37)
        activity.startAnimating()
        addSubview(activity)
        
        label = UILabel(frame: CGRect(x: 5, y: activity.frame.maxY + 12, width: 80, height: 21))
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Loading..."
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    
    private func progressView(_ title: String?) -> KDProgressHUD {
        if let progress = viewWithTag(3441) as? KDProgressHUD {
            progress.removeFromSuperview()
        }
        
        let progressView = KDProgressHUD()
        progressView.setTitle(title)
        progressView.frame = CGRect(x: UIScreen.main.bounds.size.width/2 - 50, y: UIScreen.main.bounds.size.height/2 - 50, width: 100, height: 100)
        progressView.tag = 3441
        return progressView
    }
    
    public func startProgress(_ title: String? = "Loading...") {
        addSubview(progressView(title))
    }
    
    public func stopProgress() {
        guard let progressView = viewWithTag(3441) as? KDProgressHUD else {
            return
        }
        progressView.removeFromSuperview()
    }
    
}

extension UIViewController {
    
    func startProgress(_ title: String? = "Loading...") {
        view.startProgress(title)
    }
    
    func stopLoading() {
        view.stopProgress()
    }
    
}

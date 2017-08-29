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
        activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.frame = CGRect(x: 32, y: 20, width: 37, height: 37)
        activity.startAnimating()
        addSubview(activity)
        
        label = UILabel(frame: CGRect(x: 5, y: activity.frame.maxY + 12, width: 80, height: 21))
        label.textAlignment = .center
        label.text = "Loading..."
        addSubview(label)
        
        backgroundColor = Appearance.progress.backgroundColor
        layer.cornerRadius = Appearance.progress.cornerRadius
        activity.tintColor = Appearance.progress.activityIndicatorTintColor
        label.textColor = Appearance.progress.titleColor
        label.textAlignment = Appearance.progress.textAlignment
    }
    
    public func start(for view: UIView, title: String? = "Loading...") {
        if let progress = viewWithTag(3441) as? KDProgressHUD {
            progress.removeFromSuperview()
        }
        let progressView = KDProgressHUD()
        progressView.setTitle(title)
        progressView.frame = CGRect(x: view.frame.size.width / 2 - 50, y: view.frame.size.height / 2 - 50, width: 100, height: 100)
        progressView.tag = 3441
        view.addSubview(progressView)
    }
    
    public func stop() {
        removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public class Appearance {
        
        public static let progress = Appearance()
        
        public var backgroundColor: UIColor
        public var activityIndicatorTintColor: UIColor
        public var titleColor: UIColor
        public var cornerRadius: CGFloat
        public var textAlignment: NSTextAlignment
        
        private init() {
            backgroundColor = UIColor.black.withAlphaComponent(0.5)
            titleColor = .white
            activityIndicatorTintColor = .white
            cornerRadius = 8
            textAlignment = .center
        }
    }
    
}

extension UIView {
    
    private func createProgress(title: String? = "Loading...") {
        let progress = KDProgressHUD()
        progress.start(for: self, title: title)
    }
    
    public func startProgress(_ title: String? = "Loading...") {
        createProgress()
    }
    
    public func stopProgress() {
        guard let progressView = viewWithTag(3441) as? KDProgressHUD else {
            return
        }
        progressView.removeFromSuperview()
    }
    
}

extension UIViewController {
    
    public func startProgress(_ title: String? = "Loading...") {
        view.startProgress(title)
    }
    
    public func stopProgress() {
        view.stopProgress()
    }
    
}

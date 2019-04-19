//
//  CGRectDemo.swift
//  CGRectDemo
//
//  Created by 尹华东 on 2019/4/19.
//  Copyright © 2019年 yinhuadong. All rights reserved.
//

import Foundation
import UIKit

class SwiftDemo: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SwiftDemo"
        
        view.backgroundColor = UIColor.white
        
        let greenView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        greenView.backgroundColor = UIColor.green
        view.addSubview(greenView)
        
        let minX: CGFloat = greenView.frame.minX
        print("minX is \(minX)")
        
        let maxX: CGFloat = greenView.frame.maxX
        print("maxX is \(maxX)")
        
        let minY: CGFloat = greenView.frame.minY
        print("minY is \(minY)")
        
        let maxY: CGFloat = greenView.frame.maxY
        print("maxY is \(maxY)")
        
        let midX: CGFloat = greenView.frame.midX
        print("midX is \(midX)")
        
        let midY: CGFloat = greenView.frame.midY
        print("midY is \(midY)")
        
        let width: CGFloat = greenView.frame.width
        print("width is \(width)")
        
        let height: CGFloat = greenView.frame.height
        print("height is \(height)")
        
        let rect: CGRect = greenView.frame.insetBy(dx: 10, dy: 10)
        
        let redView = UIView(frame: rect)
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
        
    }
}

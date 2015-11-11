//
//  SYWaterDropViewController.swift
//  AnimationDemo
//
//  Created by 李冲 on 15/11/11.
//  Copyright © 2015年 Mola. All rights reserved.
//

import UIKit

class SYWaterDropViewController: SYBasicViewController {
    var startButton: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let button: UIButton = UIButton(frame: CGRectMake(50, 200, 50, 40))
        button.setTitle("start", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("addWaterDrop:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        self.startButton = button
    }
    
    deinit {
        self.startButton?.removeTarget(self, action: Selector("addWaterDrop:"), forControlEvents: .TouchUpInside)
        self.startButton = nil
    }
    
    override func infomation() -> String {
        return "WaterDrop"
    }
    
    //Mark: - action
    func addWaterDrop(sender: AnyObject) {
        let from: CGFloat = 50.0
        let to = self.view.bounds.size.height - 50
        let view = SYWaterDropView(frame: CGRectMake(self.view.center.x, from, 40, 40))
        self.view.addSubview(view)
        view.startAnimationFrom(from, to: to)
        
        UIView.animateWithDuration(1.5, delay: 0, options: .CurveEaseIn, animations: { () -> Void in
            view.center = CGPointMake(view.center.x, to)
        }, completion: { (_) -> Void in
            view.completeAnimation()
            view.removeFromSuperview()
        })
    }
}

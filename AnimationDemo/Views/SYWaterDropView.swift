//
// Created by 李冲 on 15/11/11.
// Copyright (c) 2015 Mola. All rights reserved.
//

import UIKit
import QuartzCore

class SYWaterDropView : UIView {
    private var displayLink: CADisplayLink?
    var from: CGFloat
    var to: CGFloat
    
    override init(frame: CGRect) {
        self.from = 0
        self.to = 0
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        self.from = 0
        self.to = 0
        super.init(coder: aDecoder)
    }

    
    func startAnimationFrom(from: CGFloat, to: CGFloat) {
        self.from = from
        self.to = to
        self.displayLink = CADisplayLink(target: self, selector: Selector("tick:"))
        self.displayLink!.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
    }
    
    func completeAnimation() {
        self.displayLink?.removeFromRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        self.displayLink = nil
    }
    
    func tick(displayLink: CADisplayLink) {
        self.setNeedsDisplay()
    }
    

    override func drawRect(rect: CGRect) {
        if let layer = self.layer.presentationLayer() {
            var progress = 1 - (layer.position.y - to) / (self.from - self.to)
            progress = progress < 0 ? 0 : progress
            progress = progress > 1 ? 1 : progress
            let path = UIBezierPath()
            UIColor.colorFromHex(0x66ccff, alpha: 0.8).setFill()
            if (progress < 0.15) {
                let radius = self.bounds.height / 4.0
                let center = CGPointMake(self.bounds.width / 2.0, radius)
                
                path.addArcWithCenter(center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            }
            else if (progress < 0.45) {
                let radius = self.bounds.height / 4.0
                let radius1 = radius * 0.35
                let radius2 = radius * 0.65
                let center1 = CGPointMake(self.bounds.width / 2.0, radius * 0.25)
                let center2 = CGPointMake(self.bounds.width / 2.0, self.bounds.height / 2)
                
                path.addArcWithCenter(center1, radius: radius1, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
                path.moveToPoint(CGPointMake(center2.x, center2.y-radius2))
                path.addArcWithCenter(center2, radius: radius2, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            }
            else {
                let radius = self.bounds.height / 4.0
                let radius1 = radius * 0.25
                let radius2 = radius * 0.25
                let radius3 = radius - radius1 - radius2
                let centerX = self.bounds.width / 2.0
                let center1 = CGPointMake(centerX, radius1)
                let center2 = CGPointMake(centerX, radius + radius2)
                let center3 = CGPointMake(centerX, radius * 2.0 + radius3)
                
                path.addArcWithCenter(center1, radius: radius1, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
                path.moveToPoint(CGPointMake(center2.x, center2.y-radius2))
                path.addArcWithCenter(center2, radius: radius2, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
                path.moveToPoint(CGPointMake(center3.x, center3.y-radius3))
                path.addArcWithCenter(center3, radius: radius3, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
            }
            path.closePath()
            path.fill()
        }
    }
}

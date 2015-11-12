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
    
    func addWaterDrop(path: UIBezierPath, inRect rect: CGRect) {
        let width = rect.size.width
        let height = rect.size.height
        let radius = width / 2.0
        let centerX = ceil(rect.origin.x + width / 2)
        let centerY = ceil(height - radius + rect.origin.y)
        let leftX = ceil(width / 2 - radius + rect.origin.x)
        let rightX = ceil(width / 2 + radius + rect.origin.x)
        path.moveToPoint(CGPointMake(centerX, rect.origin.y))
        path.addLineToPoint(CGPointMake(leftX, centerY))
        path.moveToPoint(CGPointMake(centerX, rect.origin.y))
        path.addLineToPoint(CGPointMake(rightX, centerY))

        path.addArcWithCenter(CGPointMake(centerX, centerY),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(M_PI),
            clockwise: true);
    }

    override func drawRect(rect: CGRect) {
        if let layer = self.layer.presentationLayer() {
            var progress = 1 - (layer.position.y - to) / (self.from - self.to)
            progress = progress < 0 ? 0 : progress
            progress = progress > 1 ? 1 : progress
            let path = UIBezierPath()
            UIColor.colorFromHex(0x66ccff, alpha: 0.8).setFill()
            
            let height = self.bounds.height / 2 * (1 + progress)
            let width = self.bounds.width / 2 * (1 - progress * 0.8)
            let center = CGPointMake(self.bounds.width / 2, self.bounds.height / 2)
            let dropRect = CGRectMake(ceil(center.x - width / 2), ceil(center.y - height / 2), ceil(width), ceil(height))
            self.addWaterDrop(path, inRect: dropRect)

            path.closePath()
            path.fill()
//            path.stroke()
        }
    }
}

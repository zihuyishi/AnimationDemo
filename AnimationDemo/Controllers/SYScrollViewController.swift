//
//  SYScrollViewController.swift
//  AnimationDemo
//
//  Created by 李冲 on 15/10/14.
//  Copyright © 2015年 Mola. All rights reserved.
//

import UIKit

let PageCount: Int32 = 10

class SYScrollViewController: UIViewController {
    
    var scrollView: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let scrollViewWidth = CGFloat(PageCount) * self.view.bounds.size.width
        scrollView = UIScrollView.init(frame: self.view.bounds)
        scrollView?.contentSize = CGSizeMake(scrollViewWidth, self.view.bounds.size.height)
        scrollView?.delegate = self
        self.view.addSubview(scrollView!);
        for i in 0...PageCount {
            scrollView?.addSubview(pageView(i))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func pageFrame(index: Int32) -> CGRect {
        let screenSize = self.view.bounds.size
        let pageY: CGFloat = 0
        let pageX: CGFloat = CGFloat(index) * screenSize.width
        return CGRectMake(pageX, pageY, screenSize.width, screenSize.height)
    }
    
    func pageView(index: Int32) -> UIView {
        let frame = pageFrame(index)
        let pageView: UIView = UIView.init(frame: frame)
        pageView.layer.borderColor = UIColor.blackColor().CGColor
        pageView.layer.borderWidth = 2;
        let label: UILabel = UILabel.init()
        pageView.addSubview(label)
        label.backgroundColor = UIColor.yellowColor()
        label.textColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(24)
        label.text = String.init(index)
        label.center = CGPointMake(frame.size.width/2, frame.size.height/2)
        label.sizeToFit()
        
        return pageView
    }

}


// MARK: - UIScrollViewDelegate
extension SYScrollViewController: UIScrollViewDelegate {
    func pageForOffset(offset: CGPoint) -> Int32 {
        let pageWidth = self.view.bounds.width
        let page = round(offset.x / pageWidth)
        return Int32(page)
    }
    func nearestTargetOffsetForOffset(offset: CGPoint) -> CGPoint {
        let pageWidth = self.view.bounds.width
        let page = round(offset.x / pageWidth)
        let targetX = pageWidth * page
        return CGPointMake(targetX, offset.y)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("scrollViewDidScroll")
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("scrollViewWillEndDragging")
        let targetOffset = self.nearestTargetOffsetForOffset(targetContentOffset.memory)
        targetContentOffset.memory.x = targetOffset.x
        targetContentOffset.memory.y = targetOffset.y
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        print("scrollViewWillBeginDecelerating")
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
    }
    
}
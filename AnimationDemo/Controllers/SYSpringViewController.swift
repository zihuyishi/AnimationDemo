//
//  SYSpringViewController.swift
//  AnimationDemo
//
//  Created by 李冲 on 15/10/10.
//  Copyright © 2015年 Mola. All rights reserved.
//

import UIKit

class SYSpringViewController: SYBasicViewController {

    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: CGRectMake(50, 150, 50, 50));
        imageView!.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(imageView!);
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func infomation() -> String {
        return "Spring"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            
            let location = touch.locationInView(self.view);
            
            UIView.animateWithDuration(3.0,
                delay: 0,
                usingSpringWithDamping: 0.2,
                initialSpringVelocity: 3,
                options: UIViewAnimationOptions.CurveEaseOut,
                animations: { () -> Void in
                    self.imageView!.center = location;
                },
                completion: { (Bool) -> Void in
                    
            })
        }

    }
}

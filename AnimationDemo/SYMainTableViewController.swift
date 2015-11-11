//
//  SYMainTableViewController.swift
//  AnimationDemo
//
//  Created by 李冲 on 15/11/11.
//  Copyright © 2015年 Mola. All rights reserved.
//

import UIKit

class SYMainTableViewController: UITableViewController {
    var demos: [SYBasicViewController]?
    override func viewDidLoad() {
        super.viewDidLoad();
        demos = [
            SYSpringViewController(),
            SYScrollViewController(),
            SYWaterDropViewController(),
        ]
    }
    //MARK: - UITableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos!.count;
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("basicCell");
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "basicCell")
        }
        let viewController = demos![indexPath.row];
        cell!.textLabel?.text = viewController.infomation()
        return cell!
    }
    //MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = demos![indexPath.row];
        if let navi = self.navigationController {
            navi.pushViewController(viewController, animated: true);
        }
    }
}


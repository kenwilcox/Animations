//
//  FlingViewController.swift
//  Animations
//
//  Created by Kenneth Wilcox on 12/27/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit

class FlingViewController: UIViewController {
  
  var greenBox: UIView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.greenBox = UIView()
    self.greenBox!.backgroundColor = UIColor.greenColor()
    self.greenBox!.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 50, CGRectGetMidY(self.view.frame) - 50, 100, 100)
    self.view.addSubview(self.greenBox!)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

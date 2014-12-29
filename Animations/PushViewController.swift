//
//  PushViewController.swift
//  Animations
//
//  Created by Kenneth Wilcox on 12/29/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {
  
  var greenBox: UIView?
  var animator: UIDynamicAnimator?
  var collision: UICollisionBehavior?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.greenBox = UIView(frame: CGRectMake(CGRectGetMidX(self.view.bounds) - 50, 300, 100, 100))
    self.greenBox!.backgroundColor = UIColor.greenColor()
    self.greenBox!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/8))
    self.view.addSubview(self.greenBox!)
    
    self.animator = UIDynamicAnimator(referenceView: self.view)
    
    self.collision = UICollisionBehavior(items:[self.greenBox!])
    self.collision!.translatesReferenceBoundsIntoBoundary = true
    self.animator!.addBehavior(self.collision!)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

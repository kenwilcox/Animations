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
  var animator: UIDynamicAnimator?
  var gravity: UIGravityBehavior?
  var collision: UICollisionBehavior?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.greenBox = UIView()
    self.greenBox!.backgroundColor = UIColor.greenColor()
    self.greenBox!.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 50, CGRectGetMidY(self.view.frame) - 50, 100, 100)
    self.view.addSubview(self.greenBox!)
    
    self.animator = UIDynamicAnimator(referenceView: self.view)
    self.gravity = UIGravityBehavior(items:[self.greenBox!])
    
    // add collision behavior
    self.collision = UICollisionBehavior(items:[self.greenBox!])
    self.collision!.translatesReferenceBoundsIntoBoundary = true
    
    // Add gravity to the animator
    self.animator!.addBehavior(self.gravity)
    self.animator!.addBehavior(self.collision)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

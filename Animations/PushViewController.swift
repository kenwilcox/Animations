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
  var push: UIPushBehavior?
  var snap: UISnapBehavior?
  
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
    
    self.push = UIPushBehavior(items:[self.greenBox!], mode: .Instantaneous)
    self.push!.setAngle(CGFloat(M_PI / -2), magnitude: 10.0)
    self.animator!.addBehavior(self.push)
    
    // "push" on tap
    var tap = UITapGestureRecognizer(target: self, action: "onTap:")
    self.greenBox!.addGestureRecognizer(tap)
    
    // add snap gesture recognizer
    self.snap = UISnapBehavior(item: self.greenBox!, snapToPoint: CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)))
    
    var pan = UIPanGestureRecognizer(target: self, action: "onPan:")
    self.greenBox!.addGestureRecognizer(pan)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func onPan(pan: UIPanGestureRecognizer) {
    var location = pan.locationInView(self.view);
    self.animator!.removeAllBehaviors()
    
    if pan.state == .Began {
      
      self.greenBox!.center = pan.locationOfTouch(0, inView: self.view);
    }
    
    if pan.state == .Changed {
      self.greenBox!.center = pan.locationOfTouch(0, inView: self.view)
    }
    
    if pan.state == .Ended {
      self.animator!.addBehavior(self.snap);
      
    }
  }
  
  func onTap(tap: UITapGestureRecognizer) {
    self.animator!.removeBehavior(self.snap)
    self.animator!.addBehavior(self.push)
    self.animator!.addBehavior(self.collision)
    
    self.push!.active = false
    self.push!.setAngle(CGFloat(M_PI / -2), magnitude: 10.0)
    self.push!.active = true
  }
  
}

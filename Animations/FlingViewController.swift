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
  
  var panGesture: UIPanGestureRecognizer?
  
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
    
    // add pan getsture recognizer
    self.panGesture = UIPanGestureRecognizer(target: self, action: "panning:")
    self.greenBox!.addGestureRecognizer(panGesture!)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func panning(pan: UIPanGestureRecognizer) {
    var location = pan.locationInView(self.view)
    var touchLocation = pan.locationInView(self.greenBox)
    
    if pan.state == UIGestureRecognizerState.Began {
      self.animator!.removeAllBehaviors()
      self.greenBox!.center = location
    } else if pan.state == UIGestureRecognizerState.Changed {
      self.greenBox!.center = location
    } else if pan.state == UIGestureRecognizerState.Ended {
      self.animator!.addBehavior(self.gravity)
      self.animator!.addBehavior(self.collision)
    }
  }
}

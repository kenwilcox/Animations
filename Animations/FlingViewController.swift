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
  var attach: UIAttachmentBehavior?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.greenBox = UIView()
    self.greenBox!.backgroundColor = UIColor.greenColor()
    self.greenBox!.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 50, CGRectGetMidY(self.view.frame) - 50, 50, 50)
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
    
    if pan.state == .Began {
      
      self.animator!.removeAllBehaviors()
      
      var offset = UIOffsetMake(touchLocation.x - CGRectGetMidX(self.greenBox!.bounds), touchLocation.y - CGRectGetMidY(self.greenBox!.bounds))
      self.attach = UIAttachmentBehavior(item: self.greenBox!, offsetFromCenter: offset, attachedToAnchor: location)
      self.animator!.addBehavior(self.attach)
      
    } else if pan.state == .Changed {
      
      self.attach!.anchorPoint = location
      
    } else if pan.state == .Ended {
      
      self.animator!.removeBehavior(self.attach)
      
      // Add some behavior to the box
      var itemBehavior = UIDynamicItemBehavior(items:[self.greenBox!])
      itemBehavior.addLinearVelocity(pan.velocityInView(self.view), forItem: self.greenBox!)
      itemBehavior.angularResistance = 0.3
      itemBehavior.elasticity = 0.6
      self.animator!.addBehavior(itemBehavior)
      
      self.animator!.addBehavior(self.gravity)
      self.animator!.addBehavior(self.collision)
      
    }
  }
}

//
//  ViewController.swift
//  Animations
//
//  Created by Kenneth Wilcox on 12/21/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
  }

  @IBAction func animateButtonPressed(sender: UIButton) {
    super.viewDidLoad()
    
    let coloredSquare = UIView()
    let size : CGFloat = CGFloat( Int(rand()) %  40 + 20)
    let yPosition : CGFloat = CGFloat( Int(rand()) %  Int(self.view.frame.height * 0.5) + 20)
    
    coloredSquare.backgroundColor = UIColor.blueColor()
    coloredSquare.frame = CGRect(x: 0, y: yPosition, width: size, height: size)
    
    self.view.addSubview(coloredSquare)
    
    UIView.animateWithDuration(1.0, animations: {
      coloredSquare.backgroundColor = UIColor.redColor()
      let newFrame = CGRect(x: 0, y: 0, width: size * 2, height: size * 2)
      coloredSquare.frame = CGRect(x: self.view.frame.width - newFrame.width, y:yPosition, width: newFrame.width, height: newFrame.height)
      }, completion: { finished in
        UIView.animateWithDuration(1.0, delay: 1.0, options: .CurveEaseOut, animations: {
          coloredSquare.backgroundColor = UIColor.blueColor()
          coloredSquare.frame = CGRect(x: 0, y: yPosition, width: size, height: size)
          }, completion: {finished in
            
            UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .CurveEaseInOut | .Autoreverse, animations: {
              coloredSquare.backgroundColor = UIColor.greenColor()
              coloredSquare.frame = CGRect(x: 0, y: self.view.frame.height - (size * 2), width: size * 2, height: size * 2)
              }, completion: { finished in
                // Go back to "home"
                coloredSquare.backgroundColor = UIColor.blueColor()
                coloredSquare.frame = CGRect(x: 0, y: yPosition, width: size, height: size)
                coloredSquare.removeFromSuperview()
            })
            
        })
    })
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


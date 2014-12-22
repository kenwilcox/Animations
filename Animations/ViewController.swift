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
    super.viewDidLoad()
    
    let coloredSquare = UIView()
    coloredSquare.backgroundColor = UIColor.blueColor()
    coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
    
    self.view.addSubview(coloredSquare)
    
    UIView.animateWithDuration(1.0, animations: {
      coloredSquare.backgroundColor = UIColor.redColor()
      let newFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
      coloredSquare.frame = CGRect(x: self.view.frame.width - newFrame.width, y:120, width: newFrame.width, height: newFrame.height)
      }, completion: { finished in
        UIView.animateWithDuration(1.0, delay: 1.0, options: .CurveEaseOut, animations: {
          coloredSquare.backgroundColor = UIColor.blueColor()
          coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
          }, completion: {finished in
        
            UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .CurveEaseInOut, animations: {
              coloredSquare.backgroundColor = UIColor.greenColor()
              coloredSquare.frame = CGRect(x: 0, y: self.view.frame.height - 100, width: 100, height: 100)
              }, completion: { finished in
                
            })
            
        })
    })

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


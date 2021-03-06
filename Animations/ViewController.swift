//
//  ViewController.swift
//  Animations
//
//  Created by Kenneth Wilcox on 12/21/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var numberSlider: UISlider!
  @IBOutlet weak var countLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.countLabel.text = "\(Int(self.numberSlider.value))"
  }

  @IBAction func numberSliderChanged(sender: AnyObject) {
    self.countLabel.text = "\(Int(self.numberSlider.value))"
  }
  
  @IBAction func animateButtonPressed(sender: UIButton) {
    let number = Int(self.numberSlider.value)
    for loopNumber in 1...number {
      let coloredSquare = UIView()
      let size: CGFloat = CGFloat( Int(rand()) %  40 + 20)
      let yPosition: CGFloat = CGFloat( Int(rand()) % Int(self.view.frame.height * 0.75))
      let xPosition: CGFloat = CGFloat( Int(rand()) % Int(self.view.frame.width))
      
      coloredSquare.backgroundColor = UIColor.blueColor()
      coloredSquare.layer.zPosition = -99;
      coloredSquare.frame = CGRect(x: 0-size, y: yPosition, width: size, height: size)
      
      self.view.addSubview(coloredSquare)
      // randomize the delay
      let delay = NSTimeInterval(((Float(rand()) % 900.0) + 100.0) / 1000.0)
      
      UIView.animateWithDuration(2.0, delay: delay, options: .CurveEaseOut, animations: {
        coloredSquare.backgroundColor = UIColor.redColor()
        let newFrame = CGRect(x: 0, y: 0, width: size * 2, height: size * 2)
        coloredSquare.frame = CGRect(x: self.view.frame.width - newFrame.width, y:yPosition, width: newFrame.width, height: newFrame.height)
        }, completion: { finished in
          UIView.animateWithDuration(2.0, delay: delay, options: .CurveEaseOut, animations: {
            coloredSquare.backgroundColor = UIColor.blueColor()
            coloredSquare.frame = CGRect(x: 0, y: yPosition, width: size, height: size)
            }, completion: {finished in
              
              UIView.animateWithDuration(2.0, delay: delay * 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .CurveEaseInOut, animations: {
                coloredSquare.backgroundColor = UIColor.greenColor()
                coloredSquare.frame = CGRect(x: xPosition, y: self.view.frame.height - (size * 2), width: size * 2, height: size * 2)
                }, completion: { finished in

                  UIView.animateWithDuration(0.5, animations: {
                    // Go back to "home"
                    coloredSquare.backgroundColor = UIColor.blueColor()
                    coloredSquare.frame = CGRect(x: xPosition, y: -size, width: size, height: size)
                    }, completion: {finished in
                      coloredSquare.removeFromSuperview()
                  })
                  
              })
              
          })
      })
    }
    

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


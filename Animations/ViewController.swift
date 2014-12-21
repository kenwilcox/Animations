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
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


//
//  NWTabbar.swift
//  Medi-Covid
//
//  Created by Nawin Phunsawat on 19/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

//
//  Nawin+Tabbar.swift
//  Medi-Covid
//
//  Created by Nawin Phunsawat on 19/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class NWTabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        let viewController:UIViewController = UIStoryboard(name: "StatisticStoryboard", bundle: nil).instantiateViewController(withIdentifier: "Statistic") as! StatisticViewController
        
        let viewController2:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as! ViewController
        
        
        viewController.tabBarItem = UITabBarItem(title: "Home",
                                                 image: UIImage(named: "outline_local_hospital_black_24pt", in: nil,
                                                                compatibleWith: nil)?.withRenderingMode(.alwaysTemplate),
                                                 selectedImage: UIImage(named: "outline_local_hospital_black_24pt", in: nil,
                                                                        compatibleWith: nil)?.withRenderingMode(.alwaysTemplate))
        viewController2.tabBarItem = UITabBarItem(title: "Stat",
                                                  image: UIImage(named: "outline_assessment_black_24pt", in: nil,
                                                                 compatibleWith: nil)?.withRenderingMode(.alwaysTemplate),
                                                  selectedImage: UIImage(named: "outline_assessment_black_24pt", in: nil, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate))

        let controllers = [viewController,viewController2]
        self.viewControllers = controllers
        UITabBar.appearance().tintColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // find index if the selected tab bar item, then find the corresponding view and get its image, the view position is offset by 1 because the first item is the background (at least in this case)
        
        guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > idx + 1, let imageView = tabBar.subviews[idx + 1].subviews.compactMap ({ $0 as? UIImageView }).first else {
            return
        }
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.3)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        
        imageView.layer.add(bounceAnimation, forKey: nil)
        
    }
}

extension UIImage {
    
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

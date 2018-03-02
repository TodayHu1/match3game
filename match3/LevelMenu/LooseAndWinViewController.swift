//
//  LooseAndWinViewController.swift
//  match3
//
//  Created by Евгений on 24.02.2018.
//  Copyright © 2018 Женя. All rights reserved.
//

import UIKit
import GoogleMobileAds

class LooseAndWinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAD() {
        if ad.isReady {
            print("Ad ready")
            ad.present(fromRootViewController: topMostController())
        } else {
            print("Ad wasn't ready")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showAD()
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  SwiftUIViewController.swift
//  AKMaskFieldExample
//
//  Created by Іван Богоносюк on 23.03.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import UIKit
import SwiftUI

class SwiftUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @available(iOS 13.0, *)
    @IBSegueAction func showSwiftUI(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView().environment(\.colorScheme, .light))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

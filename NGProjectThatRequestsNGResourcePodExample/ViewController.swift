//
//  ViewController.swift
//  NGProjectThatRequestsNGResourcePodExample
//
//  Created by Noah Gilmore on 2/12/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let label = UILabel()
        view.addSubview(label)
        label.frame = CGRect(x: 40, y: 60, width: 200, height: 200)

        guard let podBundleUrl = Bundle.main.url(forResource: "NGResourcePodExample", withExtension: "bundle"),
            let podBundle = Bundle(url: podBundleUrl) else {
                fatalError("Pod resource bundle not found")
        }
        let url = podBundle.url(forResource: "message", withExtension: "txt")!
        guard let content = try? String(contentsOf: url) else {
            fatalError("Could not read content string")
        }
        label.text = content
    }


}


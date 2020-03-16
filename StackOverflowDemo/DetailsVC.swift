//
//  DetailsVC.swift
//  StackOverflowDemo
//
//  Created by Prasenjit Mallick on 3/15/20
//  Copyright © 2020 Prasenjit Mallick . All rights reserved.
//

import UIKit

class DetailsVC: MasterVC {

    @IBOutlet weak var webView: UIWebView!
    var index = Int()
    var showType = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.size.height, width: view.frame.size.width, height:44))
               let navigationItem = UINavigationItem()
               navigationItem.title = "Answers"
               navigationBar.items = [navigationItem]
               self.view.addSubview(navigationBar)
        let leftButton =  UIBarButtonItem(title: "Back", style:   UIBarButtonItem.Style.plain, target: self, action: #selector(btn_clicked))
        navigationItem.leftBarButtonItem = leftButton
        self.view.addSubview(navigationBar)

        


        var link = PersistentDataModel.shared().jsonData?.items![index].link
        if showType == "owner"
        {
            navigationItem.title = "User Info"
            link = PersistentDataModel.shared().jsonData?.items![index].owner?.link
        }
        webView.loadRequest(NSURLRequest(url: NSURL(string: link!)! as URL) as URLRequest)
        // Do any additional setup after loading the view.
    }
    
    @objc func btn_clicked(sender: UIBarButtonItem) {
     self.navigationController?.popViewController(animated: true)
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

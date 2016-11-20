//
//  EndViewController.swift
//  TIME
//
//  Created by nowall on 2016/11/19.
//  Copyright © 2016年 阿部 拓磨. All rights reserved.
//

import UIKit
import Social



class EndViewController: UIViewController, UITextViewDelegate{
    
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard
        //         iPhone端末内にremainTimeというkeyで何も保存されていなかったら、空のarrayを保存する(エラー回避)
        //        if (ud.object(forKey: "myLabel") == nil) {
        //            ud.set(forKey: "myLabel")
        //        }
        showmyLabel()
    }

    func showmyLabel() {
        // UserDefaultsを使って、iPhone端末内に保存されている問題を取り出し、myLabel定数に格納
        let ud = UserDefaults.standard
        let myLabel = ud.object(forKey: "myLabel")
        
        countLabel.text = myLabel as! String?
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   //     @IBOutlet weak var gazou: UIImageView!
    
    var myComposeView : SLComposeViewController!
    
    @IBAction func facebook(_ sender: UIButton) {
        myComposeView = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        //投稿するテキスト
        myComposeView.setInitialText("わたしに残された時間は・・・でした。")
        
        //        myComposeView.add(gazou.image)
        
        //画面遷移
        self.present(myComposeView, animated:true, completion: nil)
    }
    
    
    @IBAction func twitter(_ sender: UIButton)
    {
        //facebook連携
        // postToTwitterと同様.
        // ServiceTypeをFacebookに指定.
        myComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        // 投稿するテキストを指定.
        myComposeView.setInitialText("わたしに残された時間は・・・でした。")
        
        // 投稿する画像を指定.
        //        myComposeView.add(gazou.image)
        
        // myComposeViewの画面遷移.
        self.present(myComposeView, animated: true, completion: nil)
        
        
    }
}
    /////////////////////////////////////////////////////////////////
    
    
    
    
    //
    //        override func viewDidLoad() {
    //            super.viewDidLoad()
    //
    //            // Do any additional setup after loading the view.
    //        }
    //
    //        override func didReceiveMemoryWarning() {
    //            super.didReceiveMemoryWarning()
    //            // Dispose of any resources that can be recreated.
    //        }


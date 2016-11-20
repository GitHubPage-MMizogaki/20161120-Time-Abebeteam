//
//  MainViewController.swift
//  TIME
//
//  Created by nowall on 2016/11/19.
//  Copyright © 2016年 阿部 拓磨. All rights reserved.
//

import UIKit




class MainViewController: UIViewController,UITextFieldDelegate{
    
    //年齢の入力
    @IBOutlet weak var ageLabel: UITextField!
    //月収の入力
    @IBOutlet weak var moneyLabel: UITextField!
    //月の労働時間の入力
    @IBOutlet weak var hourLabel: UITextField!
    //ナンバープレートを下げる
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var myLabel: UITextField!
    
    
    @IBAction func showBtn(_ sender: Any) {
        
        
        let age:Int? = Int(ageLabel.text!)
        let money:Int? = Int(moneyLabel.text!)
        let hour:Int? = Int(hourLabel.text!)
        _ = Timer()
        
        //月収＊12ヶ月＊10000(万円へ変換)
        let monsGet = money!*120000
        //時間相場を1H=¥2100と定める
        let getTime = monsGet/2100
        
        print(monsGet)
        print(getTime)
        
        //生涯獲得時間ー労働時間
        let use = (getTime*60)-(hour!*12*60)
        //寿命は80年700800Hに定める
        let useTime = 700800+use
        print(use)
        print(useTime)
        
        
        //年齢＊24時間＊365日
        let aTime = (age!*24*365)
        print(aTime)
        //使える時間ー年齢分の時間
        let remainTime = (useTime-aTime)
        print(remainTime)
        
        let remainSecTime = (remainTime*60*60)     //残りの秒数
        print(remainSecTime)
        
        let minuts = remainSecTime/60              //分へ変換
        let minutsRemainder = remainSecTime%60     //変換の余りの秒数ー＞表示
        print(minuts)
        print(minutsRemainder)
        
        let houres = minuts/60                     //変換した分を時間へ変換
        let hourRmainder = minuts%60               //変換の余りの分数ー＞表示
        print(houres)
        print(hourRmainder)
        
        let day = houres/24                  //変換した時間を日にちに変換
        let dayRemainder = houres%24         //変換の余りの時間ー＞表示
        print(day)
        print(dayRemainder)
        
        let year = day/365                 //変換した日にちを年に変換
        let yearRemainder = day%365        //変換の余りの日にちー＞表示
        print(year)
        print(yearRemainder)
        
        let timeArray = [year,yearRemainder,dayRemainder,hourRmainder,minutsRemainder]
        var mytime = String(timeArray[0])  + ":" + String(timeArray[1])
        mytime = mytime + ":" + String(timeArray[2]) + ":" + String(timeArray[3])
        mytime = mytime + ":" + String(timeArray[4])
        
        print(mytime)
        
        myLabel.text = String(describing: mytime)
        
        let ud = UserDefaults.standard
        
        ud.set(myLabel.text, forKey: "myLabel")
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

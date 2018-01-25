//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 田口哲弘 on 2018/01/17.
//  Copyright © 2018年 aisbranding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.imageName = imageNames[imageViewNo]
      
    }
    
    
    let imageNames = ["swift-0", "swift-1", "swift-2"]
    var imageViewNo = 0
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage(named: imageNames[imageViewNo])
    }
    
    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //進む
    @IBAction func button1(_ sender: Any) {
        // 表示している画像の番号を1減らす
        imageViewNo += 1
        setImageView()
    }
    
    //再生・停止
    @IBAction func button2(_ sender: Any) {
     
        if self.timer == nil {
            // タイマーの作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            nextButton.isEnabled = false
            backButton.isEnabled = false
            playButton.setTitle("停止", for: .normal)
        } else {
            self.timer.invalidate()
            self.timer = nil
            
            nextButton.isEnabled = true
            backButton.isEnabled = true
            playButton.setTitle("再生", for: .normal)
        }
    }
    
    //戻る
    @IBAction func button3(_ sender: Any) {
        imageViewNo -= 1
        setImageView()
    }
    
    func setImageView(){
        
        if imageViewNo > imageNames.count - 1 {
            imageViewNo = 0
        }
        
        if imageViewNo < 0 {
            imageViewNo = imageNames.count - 1
        }
        imageView.image = UIImage(named: imageNames[imageViewNo])
    }
    
    @objc func updateTimer(timer: Timer) {
        imageViewNo += 1
        setImageView()
    }
    
}




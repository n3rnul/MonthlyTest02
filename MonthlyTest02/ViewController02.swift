//
//  ViewController02.swift
//  MonthlyTest02
//
//  Created by nh724 on 2019/01/11.
//  Copyright © 2019 西林光. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController02: UIViewController {
	
	// Timerクラスのインスタンス作成
	var tmr = Timer()
	// タイマーを開始する時刻
	var start : Double = 0.0
	// タイマーの秒数を設定
	var count = 60
	
	@IBOutlet weak var lbTimer: UILabel!
	@IBOutlet weak var ivImage: UIImageView!
	
	@objc func updateLabel() {
		
		// 経過時間　= 現在時刻 - タイマーを開始した時刻
		let keika = Date().timeIntervalSince1970 - start
		// 経過時間を小数点以下で切り捨て
		let kirisute = Int(floor(keika))
		// 残り時間 = タイマーに設定した秒数 - 小数点以下で切り捨てた経過時間
		let nokori = count - kirisute
		// ラベルに表示
		let str = String(format: "あと%d秒！！！！！", nokori)
		lbTimer.text = str
		
		// 0秒になった時の処理
		if nokori == 0 {
			
			// タイマーを停止
			tmr.invalidate()
			
			// Alertの設定
			let alert = UIAlertController(
				title: "＼(^o^)／",
				message: "ｵﾜﾀ",
				preferredStyle: .alert)
			
			let okAction = UIAlertAction(
				title: "The End.",
				style: .default,
				handler: nil)
			
			alert.addAction(okAction)
			present(
				alert,
				animated: true,
				completion: nil)
			
			// 音声（iOSシステムサウンド）を再生
			AudioServicesPlaySystemSound(1027)
			// 画像の切り替え
			ivImage.image = UIImage(named: "earth")
		}
	}
	
	// [スタート]ボタン押下時
	@IBAction func pushStart(_ sender: UIButton) {
		
//		// 画像を元に戻す
//		if  nokori == 0 {
//			ivImage.image = UIImage(named: "back02")
//		}
		
		// ラベルに設定したタイマーの秒数を表示
		lbTimer.text = ("あと\(count)秒！！！！！")
		// 現在時刻を取得し、1秒毎にupdateLabelメソッドを実行しラベルを更新
		start = Date().timeIntervalSince1970
		tmr = Timer.scheduledTimer(
			timeInterval: 1.0,
			target: self,
			selector: #selector(self.updateLabel),
			userInfo: nil,
			repeats: true)
	}
	
	// [ストップ]ボタン押下時
	@IBAction func pushStop(_ sender: UIButton) {
		// タイマーを停止
		tmr.invalidate()
	}
}


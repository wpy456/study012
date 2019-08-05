//
//  ViewController.swift
//  study012
//
//  Created by PeiYu Wang on 2019/8/4.
//  Copyright © 2019 PeiYu Wang. All rights reserved.
//播放声音

import UIKit
import  AudioToolbox//播放系统声音
import AVFoundation
import AVKit
class ViewController: UIViewController ,AVAudioPlayerDelegate{

    var audioPalyer:AVAudioPlayer=AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        var _soundId:SystemSoundID=0//声明一个系统声音标识类型的声音变量
        let path=Bundle.main.path(forResource: "Alarm01", ofType: "wav")//获得路径
        let soundUrl=URL(fileURLWithPath: path!)//将字符串转换为URL路径
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &_soundId)//加载文件，创建system sound 对象
        
        AudioServicesAddSystemSoundCompletion(_soundId, nil, nil, {(soundId,clientData)->Void in
            print("结束之后，重复")
            AudioServicesPlaySystemSound(soundId)
        }, nil)//播放结束状态监听
        AudioServicesPlaySystemSound(_soundId)//开始播放
        
        
        let path2=Bundle.main.path(forResource: "mp3", ofType: "mp3")//获得路径
        let soundUrl2=URL(fileURLWithPath: path2!)//将字符串转换为URL路径
        
        do{
            try audioPalyer=AVAudioPlayer(contentsOf: soundUrl2)
            audioPalyer.volume=1.0
            audioPalyer.numberOfLoops = -1
            audioPalyer.delegate=self
            audioPalyer.play()
            
        }catch{
            print(error)
        }
        let stopMusic=UIButton(frame: CGRect(x: 20, y: 80, width: 280, height: 44))
        stopMusic.backgroundColor=UIColor.purple
        stopMusic.setTitle("暂停/恢复", for: UIControl.State.init(rawValue: 0))
        stopMusic.addTarget(self, action: #selector(pauseOrResumeMusic), for: .touchUpInside)
        self.view.addSubview(stopMusic)
        */
        /*
        let path3=Bundle.main.path(forResource: "mp4", ofType: "mp4")//获得路径
        let soundUrl3=URL(fileURLWithPath: path3!)//将字符串转换为URL路径
        
        let avPlayer=AVPlayer(url: soundUrl3)
        let avPlayerLayer=AVPlayerLayer(player: avPlayer)
        avPlayerLayer.frame=self.view.bounds
        avPlayerLayer.videoGravity=AVLayerVideoGravity.resizeAspectFill
        self.view.layer.addSublayer(avPlayerLayer)
        
        avPlayer.play()
        */
        let path4=Bundle.main.path(forResource: "mp4", ofType: "mp4")//获得路径
        let soundUrl4=URL(fileURLWithPath: path4!)//将字符串转换为URL路径
        
        let avPlayer2=AVPlayer(url: soundUrl4)
        let playerVC=AVPlayerViewController()
        playerVC.player=avPlayer2
        playerVC.videoGravity=AVLayerVideoGravity.resizeAspect
        playerVC.allowsPictureInPicturePlayback=true
        playerVC.view.frame=self.view.bounds
        
        playerVC.player!.play()
        self.view.addSubview(playerVC.view)
    }


    @objc func pauseOrResumeMusic(){
        if audioPalyer.isPlaying{
            audioPalyer.pause()
        }else{
            audioPalyer.play()
        }
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        print("打断")
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("完毕")
    }
}


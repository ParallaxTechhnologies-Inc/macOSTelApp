//
//  ViewController.swift
//  HospitalTelApp
//
//  Created by 春名卓哉 on 2020/05/14.
//  Copyright © 2020 Parallax. All rights reserved.
//

import Cocoa
class ViewController: NSViewController, NSWindowDelegate{
    

    //遅延インスタンス
    private lazy var textField: NSTextField = {
        let textField = NSTextField()
        textField.placeholderString = "電話番号を入力"
        textField.textColor = NSColor.white
        return textField
    }()
    
    
    //遅延インスタンス
    private lazy var telButton: NSButton = {
        let button = NSButton()
        button.title = "電話"
        button.action = #selector(printSomething)
        return button
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(NSScreen.main?.frame.height)
        print(NSScreen.main?.frame.width)
        
        //Viewへ追加
        self.view.addSubview(textField)
        self.view.addSubview(telButton)
    }
    
    override func viewDidAppear() {
        view.window?.delegate = self
    }
    func windowDidResize(_ notification: Notification) {
        //アプリの画面サイズが変更された時に呼ばれる。この時にUIの位置も変更する
        var screenWidth = view.window?.frame.size.width
        var screenHeight = view.window?.frame.size.height
        self.textField.frame = CGRect(x: (screenWidth ?? 0)*0.2, y: (screenHeight ?? 0)*0.6, width: (screenWidth ?? 0)*0.6, height: 100)
        self.telButton.frame = CGRect(x: (screenWidth ?? 0)*0.3, y: self.textField.frame.minY - 100, width: (screenWidth ?? 0)*0.4, height: 50)
    }
    
    
    //電話ボタン
    @objc
    func printSomething() {
        if (self.textField.stringValue == ""){
            print("入力されていない")
        }else {
            facetime(phoneNumber: self.textField.stringValue)
        }
    }
    
    private func facetime(phoneNumber:String) {
      if let facetimeURL:NSURL = NSURL(string: "facetime://\(phoneNumber)") {
        let application:NSWorkspace = NSWorkspace.init()
        if (application.open(facetimeURL as URL)) {
            application.open(facetimeURL as URL)
        }
      }
    }



}

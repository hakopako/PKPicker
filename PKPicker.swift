/*********************************************************************
 PKPicker.swift
 PKPicker
 
 Created by hakopako on 2016/09/24.
 Copyright (c) 2016 hakopako.
 Source:https://github.com/hakopako/pkPicker
 
 Permission is hereby granted, free of charge, to any person obtaining a
 copy of this software and associated documentation files (the
 "Software"), to deal in the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to
 permit persons to whom the Software is furnished to do so, subject to
 the following conditions:
 
 The above copyright notice and this permission notice shall be included
 in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 *********************************************************************/

import Foundation
import UIKit

typealias PKButtonActionBlock = (_ messageLabel:UILabel?, _ items:Array<Int>) -> Bool
typealias PKDateActionBlock = (_ messageLabel:UILabel?, _ selectedDate:Date) -> Bool
typealias PKTupleActionBlock = (_ messageLabel:UILabel?, _ items:(Int, Int, String)) -> Bool
let _PKPickerStack:PKPickerStack = PKPickerStack()
let PKPicker:PKPickerClass = PKPickerClass()

// MARK: - @CLASS pkPickerSingleton
class PKPickerStack  {
    var vcCollection:Array<UIViewController> = Array()
}

// MARK: - @CLASS pkPicker
class PKPickerClass: UIViewController {

    //custom
    var tintColor:UIColor = UIColor(colorLiteralRed: 0, green: 122/255, blue: 1, alpha: 1)
    var titleFontColor:UIColor = UIColor.darkGray
    var titleFontStyle:UIFont = UIFont.boldSystemFont(ofSize: 17)
    var messageFontColor:UIColor = UIColor.gray
    var messageFontStyle:UIFont = UIFont.systemFont(ofSize: 13)
    var buttonFontColor:UIColor = UIColor.gray
    var backgroundColor:UIColor = UIColor.white
    var cornerRadius:CGFloat = 1
    var doneButtonText:String = "Done"
    var cancelButtonText:String = "Cancel"
    var width:CGFloat = 300
    private var margin:CGFloat = 8

    
    // MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NotificationCenter.default.addObserver(self, selector: #selector(PKPickerClass.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Call methods
    func list(title t:String?, items i:Array<String>?, defaultSelected d:Array<Int>, allowMulti al:Bool, action ac:@escaping PKButtonActionBlock) {
        let pickerListVC:PKPickerList = PKPickerList(title:t, items:i, defaultSelected:d, allowMulti:al, action:ac, parent: self)
        pickerListVC.view.alpha = 0
        _PKPickerStack.vcCollection.append(pickerListVC)
        pickerListVC.view.center = UIApplication.shared.windows[0].center
        UIApplication.shared.windows[0].addSubview(pickerListVC.view)
        
        //pickerListVC.view.transform = CGAffineTransformIdentity.scaledBy(x: 1.1, y: 1.1);
        UIView.animate(withDuration: 0.1,
                                   delay: 0,
                                   options: UIViewAnimationOptions.curveLinear,
                                   animations: { () -> Void in
                                    pickerListVC.view.alpha = 1
                                    //pickerListVC.view.transform = CGAffineTransformIdentity.scaledBy(x: 1, y: 1);
            },
                                   completion: { (finished:Bool) -> Void in
                                    
        })
    }
    
    func drum(title t:String?, items i:[[String]], defaultSelected d:Array<Int>, action ac:@escaping PKButtonActionBlock) {
        let pickerDrumVC:PKPickerDrum = PKPickerDrum(title:t, items:i, defaultSelected:d, action:ac, parent: self)
        pickerDrumVC.view.alpha = 0
        _PKPickerStack.vcCollection.append(pickerDrumVC)
        pickerDrumVC.view.center = UIApplication.shared.windows[0].center
        UIApplication.shared.windows[0].addSubview(pickerDrumVC.view)
        
        //pickerListVC.view.transform = CGAffineTransformIdentity.scaledBy(x: 1.1, y: 1.1);
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: UIViewAnimationOptions.curveLinear,
                       animations: { () -> Void in
                        pickerDrumVC.view.alpha = 1
                        //pickerListVC.view.transform = CGAffineTransformIdentity.scaledBy(x: 1, y: 1);
            },
                       completion: { (finished:Bool) -> Void in
                        
        })
    }
    
    func date(title t:String?, format f:UIDatePickerMode, defaultSelected d:Date, action ac:@escaping PKDateActionBlock) {
        let pickerDateVC:PKPickerDate = PKPickerDate(title:t, format:f, defaultSelected:d, action:ac, parent: self)
        pickerDateVC.view.alpha = 0
        _PKPickerStack.vcCollection.append(pickerDateVC)
        pickerDateVC.view.center = UIApplication.shared.windows[0].center
        UIApplication.shared.windows[0].addSubview(pickerDateVC.view)
        
        //pickerListVC.view.transform = CGAffineTransformIdentity.scaledBy(x: 1.1, y: 1.1);
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: UIViewAnimationOptions.curveLinear,
                       animations: { () -> Void in
                        pickerDateVC.view.alpha = 1
                        //pickerListVC.view.transform = CGAffineTransformIdentity.scaledBy(x: 1, y: 1);
            },
                       completion: { (finished:Bool) -> Void in
                        
        })
    }
    
    func clock(title t:String?, twentyFourHour h:Bool, defaultSelected d:(Int, Int, String), action ac:@escaping PKTupleActionBlock) {
        let pickerClockVC:PKPickerClock = PKPickerClock(title:t, twentyFourHour:h, defaultSelected:d, action:ac, parent: self)
        pickerClockVC.view.alpha = 0
        _PKPickerStack.vcCollection.append(pickerClockVC)
        pickerClockVC.view.center = UIApplication.shared.windows[0].center
        UIApplication.shared.windows[0].addSubview(pickerClockVC.view)
        
        //pickerListVC.view.transform = CGAffineTransformIdentity.scaledBy(x: 1.1, y: 1.1);
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: UIViewAnimationOptions.curveLinear,
                       animations: { () -> Void in
                        pickerClockVC.view.alpha = 1
                        //pickerListVC.view.transform = CGAffineTransformIdentity.scaledBy(x: 1, y: 1);
            },
                       completion: { (finished:Bool) -> Void in
                        
        })
    }


    // MARK: - Common methods
    private func generateBackground(color:UIColor, uiEnabled:Bool) -> UIView {
        let backgroundView = UIView()
        let mainScreenFrame:CGRect = UIScreen.main.bounds
        let length:CGFloat = (mainScreenFrame.width < mainScreenFrame.height) ? mainScreenFrame.height : mainScreenFrame.width
        backgroundView.frame = CGRect(x:0, y:0, width:length, height:length)
        backgroundView.backgroundColor = color
        backgroundView.isUserInteractionEnabled = uiEnabled
        return backgroundView
    }
    
    func rotated()
    {
        for anyObject in _PKPickerStack.vcCollection {
            if anyObject is PKPickerList {
                (anyObject as! PKPickerList).rotate()
            } else if anyObject is PKPickerDrum {
                (anyObject as! PKPickerDrum).rotate()
            } else if anyObject is PKPickerDate {
                (anyObject as! PKPickerDate).rotate()
            } else if anyObject is PKPickerClock {
                (anyObject as! PKPickerClock).rotate()
            }
        }
    }
    
    private func removeVCCollectionByObject(target:UIViewController) -> Void {
        let cnt:Int = 0;
        for vc:UIViewController in _PKPickerStack.vcCollection {
            if (vc == target){
                _PKPickerStack.vcCollection.remove(at: cnt)
                break;
            }
        }
    }
    
    // MARK: - @CLASS PKPickerList
    class PKPickerList: UIViewController {
        var pkPicker:PKPickerClass?
        let listView:UIView = UIView(frame: CGRect(x:0, y:0, width:100, height:100))
        var titleLabel:UILabel = UILabel()
        var listItems:Array<String> = []
        var listButton:Array<PKCheckButton> = []
        var doneAction:PKButtonActionBlock? = nil
        var allowMulti:Bool = false
        var messageLabel:UILabel = UILabel()
        var doneButton:UIButton! = UIButton()
        var cancelButton:UIButton! = UIButton()
        var selectedItems:Array<Int> = []
        private var defaultSelected:Array<Int> = []
        
        // MARK: - Lifecycle
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
        }
        
        override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
            super.init(nibName: nil, bundle: nil)
        }
        
        convenience init(title t:String?, items i:Array<String>?, defaultSelected d:Array<Int>, allowMulti al:Bool, action ac:@escaping PKButtonActionBlock, parent p:PKPickerClass) {
            self.init(nibName: nil, bundle: nil)
            self.setup(title: t, items: i!, defaultSelected: d, allowMulti: al, action: ac, parent: p)
        }
        
        override func viewDidAppear(_ animated: Bool) {
            for (i, b) in listButton.enumerated() {
                if defaultSelected.contains(i) {
                    b.on()
                }
            }
        }
        
        func setup(title t:String?, items i:Array<String>, defaultSelected d:Array<Int>, allowMulti al:Bool, action ac:@escaping PKButtonActionBlock, parent p:PKPickerClass) {
            pkPicker = p
            doneAction = ac
            allowMulti = al
            titleLabel.text = (t == nil) ? "" : t
            listItems = i
            defaultSelected = d
            for (_, b) in listItems.enumerated() {
                let tmp: PKCheckButton = PKCheckButton(isMulti: allowMulti, color:pkPicker!.tintColor)
                tmp.setTitle(b, for: .normal)
                tmp.setTitleColor(UIColor.lightGray, for: .normal)
                tmp.addTarget(self, action: #selector(self.selected(sender:)), for: .touchUpInside)
                listButton.append(tmp)
            }
            doneButton.setTitle(pkPicker?.doneButtonText, for: .normal)
            doneButton.setTitleColor(UIColor.darkGray, for: .normal)
            doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            doneButton.addTarget(self, action: #selector(self.doneDown(sender:)), for: .touchUpInside)
            cancelButton.setTitle(pkPicker?.cancelButtonText, for: .normal)
            cancelButton.setTitleColor(UIColor.lightGray, for: .normal)
            cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            cancelButton.addTarget(self, action: #selector(self.cancelDown(sender:)), for: .touchUpInside)
            messageLabel.textColor = pkPicker?.messageFontColor
            messageLabel.font = pkPicker?.messageFontStyle
            messageLabel.textAlignment = NSTextAlignment.center
            messageLabel.numberOfLines = 0
            self.resizeParts()
            
            let listBackgroundView = pkPicker?.generateBackground(color: UIColor.black, uiEnabled: true)
            listBackgroundView?.alpha = 0.3
            
            // addSubviews
            listView.addSubview(titleLabel)
            listView.addSubview(messageLabel)
            for lb:PKCheckButton in listButton {
                listView.addSubview(lb)
            }
            listView.addSubview(cancelButton)
            listView.addSubview(doneButton)
            self.view.addSubview(listBackgroundView!)
            self.view.addSubview(listView)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        deinit {
            //NSLog("########### \(NSStringFromClass(self.dynamicType)): \(self) is deinitialized. ###########")
        }
        
        // MARK: - UI
        func resizeParts() -> Void {
            /* set layout and adjust button shape */
            let margin:CGFloat = pkPicker!.margin
            let messageLabelWidth:CGFloat = pkPicker!.width - margin*2
            let titlePosY:CGFloat = margin
            let buttonWidth:CGFloat = 80
            let buttonHeight:CGFloat = 40
            
            cancelButton.frame = CGRect(x:0, y:titlePosY, width:buttonWidth, height:buttonHeight)
            titleLabel.frame = CGRect(x:buttonWidth, y:titlePosY, width:messageLabelWidth - buttonWidth * 2 + margin * 2, height:buttonHeight)
            titleLabel.textColor = pkPicker?.titleFontColor
            titleLabel.font = pkPicker?.titleFontStyle
            titleLabel.textAlignment = NSTextAlignment.center
            doneButton.frame = CGRect(x:messageLabelWidth - buttonWidth + margin * 2, y:titlePosY, width:buttonWidth, height:buttonHeight)
            
            var messagePosY:CGFloat =  titlePosY + titleLabel.frame.height + margin
            messageLabel.frame = CGRect(x:margin, y:messagePosY, width:messageLabelWidth, height:0)
            if messageLabel.text != "" {
                messagePosY += margin
                messageLabel.sizeToFit()
                messageLabel.frame = CGRect(x:((pkPicker?.width)! - messageLabel.frame.width)/2, y:messagePosY, width:messageLabel.frame.width, height:messageLabel.frame.height)
            }
            let itemPosY:CGFloat = messagePosY + messageLabel.frame.height
            
            for (i, _) in listButton.enumerated() {
                (listButton[i] as PKCheckButton).frame = CGRect(x:margin, y:(CGFloat(44 * i) + itemPosY), width:messageLabelWidth, height:44)
            }
            
            let kListHeight:CGFloat = CGFloat(itemPosY + CGFloat(listItems.count * 44) + margin)
            listView.frame.size = CGSize(width:(pkPicker?.width)!, height:kListHeight)
            listView.backgroundColor = pkPicker?.backgroundColor
            listView.layer.cornerRadius = (pkPicker?.cornerRadius)!
            listView.center = UIApplication.shared.windows[0].center
        }
        
        func rotate() -> Void {
            let point:CGPoint = UIApplication.shared.windows[0].center
            if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation))
            {
                listView.center = point
            }
            
            if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation))
            {
                listView.center = point
            }
        }
        
        // MARK: - button action
        func selected(sender: PKCheckButton!) -> Void {
            if !allowMulti {
                for b in listButton {
                    b.off()
                }
            }
            sender.toggle()
        }
        
        func doneDown(sender: UIButton!) -> Void {
            selectedItems = []
            for (i, b) in listButton.enumerated() {
                if (b as PKCheckButton).isOn {
                    selectedItems.append(i)
                }
            }
            if doneAction!(messageLabel, selectedItems) {
                buttonDown(sender: sender)
            } else {
                resizeParts()
            }
        }
        
        func cancelDown(sender: UIButton!) -> Void {
            buttonDown(sender: sender)
        }

        
        private func buttonDown(sender: UIButton!) -> Void {
            //Dissmiss alert
            UIView.animate(withDuration: 0.1,
                                       delay: 0,
                                       options: UIViewAnimationOptions.curveLinear,
                                       animations: { () -> Void in
                                        self.view.alpha = 0
                },
                                       completion: { (finished:Bool) -> Void in
                                        self.view.removeFromSuperview()
                                        let cnt:Int = 0;
                                        for vc:UIViewController in _PKPickerStack.vcCollection {
                                            if (vc == self){
                                                _PKPickerStack.vcCollection.remove(at: cnt)
                                                break;
                                            }
                                            
                                        }
            })
        }
    }
    
    // MARK: - @CLASS PKPickerDrum
    class PKPickerDrum: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
        @available(iOS 2.0, *)
        public func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return drumItems.count
        }

        var pkPicker:PKPickerClass?
        let drumView:UIView = UIView(frame: CGRect(x:0, y:0, width:100, height:100))
        var titleLabel:UILabel = UILabel()
        var drumItems:Array = [[]]
        var drumPicker: UIPickerView = UIPickerView()
        var doneAction:PKButtonActionBlock? = nil
        var messageLabel:UILabel = UILabel()
        var doneButton:UIButton! = UIButton()
        var cancelButton:UIButton! = UIButton()
        var selectedItems:Array<Int> = []
    
        
        // MARK: - Lifecycle
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
        }
        
        override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
            super.init(nibName: nil, bundle: nil)
        }
        
        convenience init(title t:String?, items i:[[String]], defaultSelected d:Array<Int>, action ac:@escaping PKButtonActionBlock, parent p:PKPickerClass) {
            self.init(nibName: nil, bundle: nil)
            self.setup(title: t, items: i, defaultSelected: d, action: ac, parent: p)
        }
        
        func setup(title t:String?, items i:[[String]], defaultSelected d:Array<Int>, action ac:@escaping PKButtonActionBlock, parent p:PKPickerClass) {
            pkPicker = p
            titleLabel.text = (t == nil) ? "" : t
            drumItems = i
            selectedItems = d
            doneAction = ac
            drumPicker.delegate = self
            drumPicker.dataSource = self
            
            doneButton.setTitle(pkPicker?.doneButtonText, for: .normal)
            doneButton.setTitleColor(UIColor.darkGray, for: .normal)
            doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            doneButton.addTarget(self, action: #selector(self.doneDown(sender:)), for: .touchUpInside)
            cancelButton.setTitle(pkPicker?.cancelButtonText, for: .normal)
            cancelButton.setTitleColor(UIColor.lightGray, for: .normal)
            cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            cancelButton.addTarget(self, action: #selector(self.cancelDown(sender:)), for: .touchUpInside)
            messageLabel.textColor = pkPicker?.messageFontColor
            messageLabel.font = pkPicker?.messageFontStyle
            messageLabel.textAlignment = NSTextAlignment.center
            messageLabel.numberOfLines = 0
            self.resizeParts()
            
            let drumBackgroundView = pkPicker?.generateBackground(color: UIColor.black, uiEnabled: true)
            drumBackgroundView?.alpha = 0.3
            
            // addSubviews
            drumView.addSubview(titleLabel)
            drumView.addSubview(messageLabel)
            drumView.addSubview(cancelButton)
            drumView.addSubview(doneButton)
            drumView.addSubview(drumPicker)
            self.view.addSubview(drumBackgroundView!)
            self.view.addSubview(drumView)
            
        }

        func resizeParts() -> Void {
            let margin:CGFloat = pkPicker!.margin
            let messageLabelWidth:CGFloat = pkPicker!.width - margin*2
            let titlePosY:CGFloat = margin
            let buttonWidth:CGFloat = 80
            let buttonHeight:CGFloat = 40
            
            cancelButton.frame = CGRect(x:0, y:titlePosY, width:buttonWidth, height:buttonHeight)
            titleLabel.frame = CGRect(x:buttonWidth, y:titlePosY, width:messageLabelWidth - buttonWidth * 2 + margin * 2, height:buttonHeight)
            titleLabel.textColor = pkPicker?.titleFontColor
            titleLabel.font = pkPicker?.titleFontStyle
            titleLabel.textAlignment = NSTextAlignment.center
            doneButton.frame = CGRect(x:messageLabelWidth - buttonWidth + margin * 2, y:titlePosY, width:buttonWidth, height:buttonHeight)
            
            var messagePosY:CGFloat =  titlePosY + titleLabel.frame.height
            messageLabel.frame = CGRect(x:margin, y:messagePosY, width:messageLabelWidth, height:0)
            if messageLabel.text != "" {
                messageLabel.sizeToFit()
                messageLabel.frame = CGRect(x:((pkPicker?.width)! - messageLabel.frame.width)/2, y:messagePosY, width:messageLabel.frame.width, height:messageLabel.frame.height)
                messagePosY += margin
            }
            
            let itemPosY:CGFloat = messagePosY + messageLabel.frame.height
            drumPicker.frame = CGRect(x:margin, y:itemPosY, width:messageLabelWidth, height: 140)
            
            let kdrumHeight:CGFloat = CGFloat(itemPosY + drumPicker.frame.height + margin)
            drumView.frame.size = CGSize(width:(pkPicker?.width)!, height:kdrumHeight)
            drumView.backgroundColor = pkPicker?.backgroundColor
            drumView.layer.cornerRadius = (pkPicker?.cornerRadius)!
            drumView.center = UIApplication.shared.windows[0].center
        }
        
        func doneDown(sender: UIButton!) -> Void {
            if doneAction!(messageLabel, selectedItems) {
                buttonDown(sender: sender)
            } else {
                resizeParts()
            }
        }
        
        func cancelDown(sender: UIButton!) -> Void {
            buttonDown(sender: sender)
        }
        
        private func buttonDown(sender: UIButton!) -> Void {
            //Dissmiss alert
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: UIViewAnimationOptions.curveLinear,
                           animations: { () -> Void in
                            self.view.alpha = 0
                },
                           completion: { (finished:Bool) -> Void in
                            self.view.removeFromSuperview()
                            let cnt:Int = 0;
                            for vc:UIViewController in _PKPickerStack.vcCollection {
                                if (vc == self){
                                    _PKPickerStack.vcCollection.remove(at: cnt)
                                    break;
                                }
                                
                            }
            })
        }
        
        func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
            return drumItems.count
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return drumItems[component].count
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            pickerView.setValue(UIColor.darkGray, forKeyPath: "textColor")
            return drumItems[component][row] as? String
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedItems[component] = row
        }
        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            let titleData = drumItems[component][row] as? String
            let myTitle = NSAttributedString(string: titleData!,
                                             attributes: [NSForegroundColorAttributeName:UIColor.darkGray])
            return myTitle
        }
        func rotate() -> Void {
            let point:CGPoint = UIApplication.shared.windows[0].center
            if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation))
            {
                drumView.center = point
            }
            
            if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation))
            {
                drumView.center = point
            }
        }
    }

    // MARK: - @CLASS PKPickerDate
    class PKPickerDate: UIViewController {

        var pkPicker:PKPickerClass?
        let dateView:UIView = UIView(frame: CGRect(x:0, y:0, width:100, height:100))
        var titleLabel:UILabel = UILabel()
        var datePicker: UIDatePicker = UIDatePicker()
        var doneAction:PKDateActionBlock? = nil
        var messageLabel:UILabel = UILabel()
        var doneButton:UIButton! = UIButton()
        var cancelButton:UIButton! = UIButton()
        var selectedDate:Date = Date()
    
        
        // MARK: - Lifecycle
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
        }
        
        override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
            super.init(nibName: nil, bundle: nil)
        }
        
        convenience init(title t:String?, format f:UIDatePickerMode, defaultSelected d:Date, action ac:@escaping PKDateActionBlock, parent p:PKPickerClass) {
            self.init(nibName: nil, bundle: nil)
            self.setup(title: t, format: f, defaultSelected: d, action: ac, parent: p)
        }
        
        func setup(title t:String?, format f:UIDatePickerMode, defaultSelected d:Date, action ac:@escaping PKDateActionBlock, parent p:PKPickerClass) {
            pkPicker = p
            titleLabel.text = (t == nil) ? "" : t
            datePicker.datePickerMode = f
            datePicker.setValue(UIColor.darkGray, forKeyPath: "textColor")
            datePicker.addTarget(self, action: #selector(PKPickerDate.updateDatePickerLabel), for: .valueChanged)
            selectedDate = d
            datePicker.date = d
            doneAction = ac
            
            doneButton.setTitle(pkPicker?.doneButtonText, for: .normal)
            doneButton.setTitleColor(UIColor.darkGray, for: .normal)
            doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            doneButton.addTarget(self, action: #selector(self.doneDown(sender:)), for: .touchUpInside)
            cancelButton.setTitle(pkPicker?.cancelButtonText, for: .normal)
            cancelButton.setTitleColor(UIColor.lightGray, for: .normal)
            cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            cancelButton.addTarget(self, action: #selector(self.cancelDown(sender:)), for: .touchUpInside)
            messageLabel.textColor = pkPicker?.messageFontColor
            messageLabel.font = pkPicker?.messageFontStyle
            messageLabel.textAlignment = NSTextAlignment.center
            messageLabel.numberOfLines = 0
            self.resizeParts()
            
            let dateBackgroundView = pkPicker?.generateBackground(color: UIColor.black, uiEnabled: true)
            dateBackgroundView?.alpha = 0.3
            
            // addSubviews
            dateView.addSubview(titleLabel)
            dateView.addSubview(messageLabel)
            dateView.addSubview(cancelButton)
            dateView.addSubview(doneButton)
            dateView.addSubview(datePicker)
            self.view.addSubview(dateBackgroundView!)
            self.view.addSubview(dateView)
            
        }

        func resizeParts() -> Void {
            let margin:CGFloat = pkPicker!.margin
            let messageLabelWidth:CGFloat = pkPicker!.width - margin*2
            let titlePosY:CGFloat = margin
            let buttonWidth:CGFloat = 80
            let buttonHeight:CGFloat = 40
            
            cancelButton.frame = CGRect(x:0, y:titlePosY, width:buttonWidth, height:buttonHeight)
            titleLabel.frame = CGRect(x:buttonWidth, y:titlePosY, width:messageLabelWidth - buttonWidth * 2 + margin * 2, height:buttonHeight)
            titleLabel.textColor = pkPicker?.titleFontColor
            titleLabel.font = pkPicker?.titleFontStyle
            titleLabel.textAlignment = NSTextAlignment.center
            doneButton.frame = CGRect(x:messageLabelWidth - buttonWidth + margin * 2, y:titlePosY, width:buttonWidth, height:buttonHeight)
            
            var messagePosY:CGFloat =  titlePosY + titleLabel.frame.height
            messageLabel.frame = CGRect(x:margin, y:messagePosY, width:messageLabelWidth, height:0)
            if messageLabel.text != "" {
                messageLabel.sizeToFit()
                messageLabel.frame = CGRect(x:((pkPicker?.width)! - messageLabel.frame.width)/2, y:messagePosY, width:messageLabel.frame.width, height:messageLabel.frame.height)
                messagePosY += margin
            }
            
            let itemPosY:CGFloat = messagePosY + messageLabel.frame.height
            datePicker.frame = CGRect(x:margin, y:itemPosY, width:messageLabelWidth, height: 140)
            
            let kdateHeight:CGFloat = CGFloat(itemPosY + datePicker.frame.height + margin)
            dateView.frame.size = CGSize(width:(pkPicker?.width)!, height:kdateHeight)
            dateView.backgroundColor = pkPicker?.backgroundColor
            dateView.layer.cornerRadius = (pkPicker?.cornerRadius)!
            dateView.center = UIApplication.shared.windows[0].center
        }
        
        func doneDown(sender: UIButton!) -> Void {
            if doneAction!(messageLabel, selectedDate) {
                buttonDown(sender: sender)
            } else {
                resizeParts()
            }
        }
        
        func cancelDown(sender: UIButton!) -> Void {
            buttonDown(sender: sender)
        }
        
        private func buttonDown(sender: UIButton!) -> Void {
            //Dissmiss alert
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: UIViewAnimationOptions.curveLinear,
                           animations: { () -> Void in
                            self.view.alpha = 0
                },
                           completion: { (finished:Bool) -> Void in
                            self.view.removeFromSuperview()
                            let cnt:Int = 0;
                            for vc:UIViewController in _PKPickerStack.vcCollection {
                                if (vc == self){
                                    _PKPickerStack.vcCollection.remove(at: cnt)
                                    break;
                                }
                                
                            }
            })
        }

        func updateDatePickerLabel(){
            selectedDate = datePicker.date
        }
        
        func rotate() -> Void {
            let point:CGPoint = UIApplication.shared.windows[0].center
            if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation))
            {
                dateView.center = point
            }
            
            if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation))
            {
                dateView.center = point
            }
        }
    }
    
    // MARK: - @CLASS PKPickerClock
    class PKPickerClock: UIViewController {
        
        var pkPicker:PKPickerClass?
        let clockView:UIView = UIView()
        let clockBaseView:UIView = UIView()
        let clockBaseBackgroundView:UIView = UIView()
        let clockOuterView:UIView = UIView()
        var titleLabel:UILabel = UILabel()
        var hourButton:UIButton = UIButton()
        var minButton:UIButton = UIButton()
        var amButton:UIButton = UIButton()
        var pmButton:UIButton = UIButton()
        var ampmLabel:UILabel = UILabel()
        var separateLabel:UILabel = UILabel()
        var labelsAmPm1to12:Array<UILabel> = []
        var labels1to12:Array<UILabel> = []
        var labels12to23:Array<UILabel> = []
        var labels00to55:Array<UILabel> = []
        var doneAction:PKTupleActionBlock? = nil
        var messageLabel:UILabel = UILabel()
        var doneButton:UIButton! = UIButton()
        var cancelButton:UIButton! = UIButton()
        var is24Hour:Bool = false
        
        var clockLineShapeLayer = CAShapeLayer()
        let clockPointView:UIView = UIView()
        let clockCenterPointView:UIView = UIView()
        
        
        // MARK: - Lifecycle
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
        }
        
        override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
            super.init(nibName: nil, bundle: nil)
        }
        
        convenience init(title t:String?, twentyFourHour h:Bool, defaultSelected d:(Int, Int, String), action ac:@escaping PKTupleActionBlock, parent p:PKPickerClass) {
            self.init(nibName: nil, bundle: nil)
            self.setup(title: t, twentyFourHour: h, defaultSelected: d, action: ac, parent: p)
        }
        
        func setup(title t:String?, twentyFourHour h:Bool, defaultSelected d:(Int, Int, String), action ac:@escaping PKTupleActionBlock, parent p:PKPickerClass) {
            pkPicker = p
            titleLabel.text = (t == nil) ? "" : t
            is24Hour = h
            hourButton.setTitle(String(d.0), for: .normal)
            hourButton.setTitleColor(UIColor.gray, for: .normal)
            hourButton.setTitleColor(pkPicker!.tintColor, for: .selected)
            hourButton.isSelected = true
            hourButton.addTarget(self, action: #selector(self.hourButtonDown(sender:)), for: .touchUpInside)
            minButton.setTitle(String(d.1), for: .normal)
            minButton.setTitleColor(UIColor.gray, for: .normal)
            minButton.setTitleColor(pkPicker!.tintColor, for: .selected)
            minButton.addTarget(self, action: #selector(self.minButtonDown(sender:)), for: .touchUpInside)
            ampmLabel.text = (d.2 == "PM") ? "PM" : "AM"
            ampmLabel.textColor = UIColor.gray
            ampmLabel.textAlignment = NSTextAlignment.center
            separateLabel.text = ":"
            separateLabel.textColor = UIColor.gray
            separateLabel.textAlignment = NSTextAlignment.center
            doneAction = ac
            
            
            for i in ["12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"] {
                let tmp:UILabel = UILabel()
                tmp.text = String(i)
                labels1to12.append(tmp)
                let tmp2:UILabel = UILabel()
                tmp2.text = String(i)
                labelsAmPm1to12.append(tmp2)
            }
            
            for i in ["00", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"] {
                let tmp:UILabel = UILabel()
                tmp.text = String(i)
                labels12to23.append(tmp)
            }
            
            for i in ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"] {
                let tmp:UILabel = UILabel()
                tmp.text = i
                labels00to55.append(tmp)
            }

            
            doneButton.setTitle(pkPicker?.doneButtonText, for: .normal)
            doneButton.setTitleColor(UIColor.darkGray, for: .normal)
            doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            doneButton.addTarget(self, action: #selector(self.doneDown(sender:)), for: .touchUpInside)
            cancelButton.setTitle(pkPicker?.cancelButtonText, for: .normal)
            cancelButton.setTitleColor(UIColor.lightGray, for: .normal)
            cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            cancelButton.addTarget(self, action: #selector(self.cancelDown(sender:)), for: .touchUpInside)
            messageLabel.textColor = pkPicker?.messageFontColor
            messageLabel.font = pkPicker?.messageFontStyle
            messageLabel.textAlignment = NSTextAlignment.center
            messageLabel.numberOfLines = 0
            
            amButton.setTitle("AM", for: .normal)
            amButton.setTitleColor(UIColor.gray, for: .normal)
            amButton.setTitleColor(pkPicker!.tintColor, for: .selected)
            amButton.backgroundColor = UIColor.white
            amButton.addTarget(self, action: #selector(self.amButtonDown(sender:)), for: .touchUpInside)
            amButton.isSelected = true
            pmButton.setTitle("PM", for: .normal)
            pmButton.setTitleColor(UIColor.gray, for: .normal)
            pmButton.setTitleColor(pkPicker!.tintColor, for: .selected)
            pmButton.backgroundColor = UIColor.white
            pmButton.addTarget(self, action: #selector(self.pmButtonDown(sender:)), for: .touchUpInside)
            clockOuterView.addGestureRecognizer(UIPanGestureRecognizer(target:self, action:#selector(self.outerViewTouch(recognizer:))))
            
            self.resizeParts()
            hour2Clock()
            let clockBackgroundView = pkPicker?.generateBackground(color: UIColor.black, uiEnabled: true)
            clockBackgroundView?.alpha = 0.3
            
            // addSubviews - static -
            clockView.addSubview(titleLabel)
            clockView.addSubview(messageLabel)
            clockView.addSubview(cancelButton)
            clockView.addSubview(doneButton)
            clockView.addSubview(hourButton)
            clockView.addSubview(separateLabel)
            clockView.addSubview(minButton)
            clockView.addSubview(ampmLabel)
            clockView.addSubview(clockBaseBackgroundView)
            // addSubview - dynamic -
            for i:UILabel in labelsAmPm1to12 { clockBaseView.addSubview(i) }
            for i:UILabel in labels1to12 { clockBaseView.addSubview(i) }
            for i:UILabel in labels12to23 { clockBaseView.addSubview(i) }
            for i:UILabel in labels00to55 { clockBaseView.addSubview(i) }
            clockBaseView.addSubview(clockPointView)
            clockBaseView.addSubview(clockCenterPointView)
            clockView.addSubview(clockBaseView)
            clockOuterView.layer.addSublayer(clockLineShapeLayer)
            clockView.addSubview(clockOuterView)
            clockView.addSubview(amButton)
            clockView.addSubview(pmButton)

            self.switchHidden()
            self.view.addSubview(clockBackgroundView!)
            self.view.addSubview(clockView)
            
        }
        
        func resizeParts() -> Void {
            let margin:CGFloat = pkPicker!.margin
            let messageLabelWidth:CGFloat = pkPicker!.width - margin*2
            let clockSize:CGFloat = messageLabelWidth - margin*3
            let titlePosY:CGFloat = margin
            let buttonWidth:CGFloat = 80
            let buttonHeight:CGFloat = 40
            let clockPos:[(x:CGFloat, y:CGFloat)] =  [(x:0, y:1), (x:1/2, y:sqrt(3)/2), (x:sqrt(3)/2, y:1/2), (x:1, y:0), (x:sqrt(3)/2, y:-1/2), (x:1/2, y:sqrt(3)/2*(-1)), (x:0, y:-1), (x:-1/2, y:sqrt(3)/2*(-1)), (x:sqrt(3)/2*(-1), y:-1/2), (x:-1, y:0), (x:sqrt(3)/2*(-1), y:1/2), (x:-1/2, y:sqrt(3)/2)]
            
            cancelButton.frame = CGRect(x:0, y:titlePosY, width:buttonWidth, height:buttonHeight)
            titleLabel.frame = CGRect(x:buttonWidth, y:titlePosY, width:messageLabelWidth - buttonWidth * 2 + margin * 2, height:buttonHeight)
            titleLabel.textColor = pkPicker?.titleFontColor
            titleLabel.font = pkPicker?.titleFontStyle
            titleLabel.textAlignment = NSTextAlignment.center
            doneButton.frame = CGRect(x:messageLabelWidth - buttonWidth + margin * 2, y:titlePosY, width:buttonWidth, height:buttonHeight)
            
            var messagePosY:CGFloat =  titlePosY + titleLabel.frame.height
            messageLabel.frame = CGRect(x:margin, y:messagePosY, width:messageLabelWidth, height:0)
            if messageLabel.text != "" {
                messagePosY += margin
                messageLabel.sizeToFit()
                messageLabel.frame = CGRect(x:((pkPicker?.width)! - messageLabel.frame.width)/2, y:messagePosY, width:messageLabel.frame.width, height:messageLabel.frame.height)
            }
            
            var itemPosY:CGFloat = messagePosY + messageLabel.frame.height
            hourButton.frame = CGRect(x: (pkPicker!.width - 60 - 20 - 60)/2, y: itemPosY, width: 60, height: 50)
            hourButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
            separateLabel.frame = CGRect(x: (pkPicker!.width - 60 - 20)/2 + 30, y: itemPosY, width: 20, height: 50)
            separateLabel.font = UIFont.systemFont(ofSize: 34)
            minButton.frame = CGRect(x: (pkPicker!.width - 60)/2 + 10 + 30, y: itemPosY, width: 60, height: 50)
            minButton.titleLabel?.font = UIFont.systemFont(ofSize: 34)
            ampmLabel.frame = CGRect(x: pkPicker!.width/2 + 10 + 30 + 20, y: itemPosY + 15, width: 50, height: 35)
            ampmLabel.font = UIFont.systemFont(ofSize: 12)
            itemPosY += 75
            clockBaseView.frame = CGRect(x: margin*2.5, y: itemPosY, width: clockSize, height: clockSize)
            clockBaseView.backgroundColor = UIColor.white
            clockBaseView.layer.cornerRadius = (clockBaseView.frame.width/2)
            clockOuterView.frame = CGRect(x: margin*2.5, y: itemPosY, width: clockSize, height: clockSize)
            clockOuterView.layer.cornerRadius = (clockOuterView.frame.width/2)
            clockPointView.frame = CGRect(x: margin*2.5, y: itemPosY, width: 30, height: 30)
            clockPointView.backgroundColor = pkPicker!.tintColor
            clockPointView.alpha = 0.3
            clockPointView.layer.cornerRadius = (clockPointView.frame.width/2)
            clockCenterPointView.frame = CGRect(x: clockSize/2 - 3, y: clockSize/2 - 3, width: 6, height: 6)
            clockCenterPointView.layer.cornerRadius = (clockCenterPointView.frame.width/2)
            clockCenterPointView.backgroundColor = pkPicker!.tintColor
            for (i, v) in labelsAmPm1to12.enumerated() {
                let radius:CGFloat = clockSize/2 - 20
                let lx:CGFloat = clockSize/2 - 20 + clockPos[i].x * radius
                let ly:CGFloat = clockSize/2 - 20  + (-1) * clockPos[i].y * radius
                v.frame = CGRect(x: lx, y: ly, width: 40, height: 40)
                v.textAlignment = NSTextAlignment.center
                v.font = UIFont.systemFont(ofSize: 15)
                v.textColor = UIColor.lightGray
            }
            for (i, v) in labels1to12.enumerated() {
                let radius:CGFloat = clockSize/2 - 50
                let lx:CGFloat = clockSize/2 - 20 + clockPos[i].x * radius
                let ly:CGFloat = clockSize/2 - 20  + (-1) * clockPos[i].y * radius
                v.frame = CGRect(x: lx, y: ly, width: 40, height: 40)
                v.textAlignment = NSTextAlignment.center
                v.font = UIFont.systemFont(ofSize: 15)
                v.textColor = UIColor.lightGray
            }
            
            for (i, v) in labels12to23.enumerated() {
                let radius:CGFloat = clockSize/2 - 20
                let lx:CGFloat = clockSize/2 - 20 + clockPos[i].x * radius
                let ly:CGFloat = clockSize/2 - 20  + (-1) * clockPos[i].y * radius
                v.frame = CGRect(x: lx, y: ly, width: 40, height: 40)
                v.textAlignment = NSTextAlignment.center
                v.font = UIFont.systemFont(ofSize: 12)
                v.textColor = UIColor.lightGray
            }
            
            for (i, v) in labels00to55.enumerated() {
                let radius:CGFloat = clockSize/2 - 20
                let lx:CGFloat = clockSize/2 - 20 + clockPos[i].x * radius
                let ly:CGFloat = clockSize/2 - 20  + (-1) * clockPos[i].y * radius
                v.frame = CGRect(x: lx, y: ly, width: 40, height: 40)
                v.textAlignment = NSTextAlignment.center
                v.font = UIFont.systemFont(ofSize: 15)
                v.textColor = UIColor.lightGray
            }
            
            amButton.frame = CGRect(x: margin + 20, y: itemPosY + clockSize - 20, width: 40, height: 40)
            amButton.layer.cornerRadius = 20
            pmButton.frame = CGRect(x: (pkPicker?.width)! - margin - 20 - 40, y: itemPosY + clockSize - 20, width: 40, height: 40)
            pmButton.layer.cornerRadius = 20
            
            let kClockHeight:CGFloat = CGFloat(itemPosY + clockBaseView.frame.height + margin*4)
            clockBaseBackgroundView.frame = CGRect(x: 0, y: itemPosY - margin*2, width: (pkPicker?.width)!, height: kClockHeight - itemPosY + margin*2)
            clockBaseBackgroundView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
            clockView.frame.size = CGSize(width:(pkPicker?.width)!, height:kClockHeight)
            clockView.backgroundColor = pkPicker?.backgroundColor
            clockView.layer.cornerRadius = (pkPicker?.cornerRadius)!
            clockView.center = UIApplication.shared.windows[0].center
        }
        
        func switchHidden() -> Void {
            amButton.isHidden = true
            pmButton.isHidden = true
            ampmLabel.isHidden = true
            for i:UILabel in labelsAmPm1to12 { i.isHidden = true }
            for i:UILabel in labels1to12 { i.isHidden = true }
            for i:UILabel in labels12to23 { i.isHidden = true }
            for i:UILabel in labels00to55 { i.isHidden = true }
            if hourButton.isSelected {
                if is24Hour {
                    for i:UILabel in labels1to12 { i.isHidden = false }
                    for i:UILabel in labels12to23 { i.isHidden = false }
                } else {
                    for i:UILabel in labelsAmPm1to12 { i.isHidden = false }
                    amButton.isHidden = false
                    pmButton.isHidden = false
                    ampmLabel.isHidden = false
                }
            } else {
                for i:UILabel in labels00to55 { i.isHidden = false }
                if !is24Hour {
                    ampmLabel.isHidden = false
                    amButton.isHidden = false
                    pmButton.isHidden = false
                }
            }
        }
        
        func hourButtonDown(sender: UIButton!) -> Void {
            minButton.isSelected = false
            hourButton.isSelected = true
            switchHidden()
            hour2Clock()
        }
        
        func minButtonDown(sender: UIButton!) -> Void {
            minButton.isSelected = true
            hourButton.isSelected = false
            switchHidden()
            min2Clock()
        }
        
        func amButtonDown(sender: UIButton!) -> Void {
            amButton.isSelected = true
            pmButton.isSelected = false
            ampmLabel.text = "AM"
        }
        
        func pmButtonDown(sender: UIButton!) -> Void {
            amButton.isSelected = false
            pmButton.isSelected = true
            ampmLabel.text = "PM"
        }
        
        func outerViewTouch(recognizer:UIPanGestureRecognizer) {
            drawClockLine(centerPoint: CGPoint(x:clockOuterView.frame.width/2, y:clockOuterView.frame.height/2),
                          touchPoint: recognizer.location(in: clockOuterView))
        }
        
        func drawClockLine(centerPoint:CGPoint, touchPoint:CGPoint) -> Void {
            let p:CGPoint = touchPoint
            let clockCenterPoint:CGPoint = centerPoint
            let touchArea = (is24Hour && hourButton.isSelected) ? clockOuterView.frame.width/2 - 90 : clockOuterView.frame.width/2 - 40
            let clockLength = clockOuterView.frame.width/2 - 35
            let clockPointLength = clockOuterView.frame.width/2 - 20
            let clockMinLength = clockOuterView.frame.width/2 - 65
            let clockMinPointLength = clockOuterView.frame.width/2 - 50
            var axlen:CGFloat, aylen:CGFloat, bxlen:CGFloat, bylen:CGFloat
            
            var xlen = p.x
            var ylen = p.y
            if (p.x < 0 || p.y < 0 || p.x > clockOuterView.frame.width || p.y > clockOuterView.frame.height) {
                return
            }
            if p.x > clockCenterPoint.x { xlen = p.x - clockCenterPoint.x }
            else { xlen = clockCenterPoint.x - p.x }
            if p.y > clockCenterPoint.y { ylen = p.y - clockCenterPoint.y }
            else { ylen = clockCenterPoint.y - p.y }
            let len = sqrt(xlen * xlen + ylen * ylen)
            
            if len < clockOuterView.frame.width/2 - 40 {
                axlen = xlen*clockMinLength / len
                aylen = ylen*clockMinLength / len
                bxlen = xlen*clockMinPointLength / len
                bylen = ylen*clockMinPointLength / len
            } else {
                axlen = xlen*clockLength / len
                aylen = ylen*clockLength / len
                bxlen = xlen*clockPointLength / len
                bylen = ylen*clockPointLength / len
            }
            
            if p.x < clockCenterPoint.x { axlen = axlen * (-1); bxlen = bxlen * (-1); }
            if p.y > clockCenterPoint.y { aylen = aylen * (-1); bylen = bylen * (-1) }
            
            if len > touchArea {
                let fromPoint:CGPoint = clockCenterPoint
                let toPoint:CGPoint = CGPoint(x:clockCenterPoint.x + axlen, y:clockCenterPoint.y - aylen)
                let edge:CGPoint = CGPoint(x:clockCenterPoint.x + bxlen, y:clockCenterPoint.y - bylen)
                let path = UIBezierPath()
                path.move(to: fromPoint)
                path.addLine(to: toPoint)
                clockLineShapeLayer.path = path.cgPath
                clockLineShapeLayer.strokeColor = pkPicker!.tintColor.cgColor
                clockLineShapeLayer.lineWidth = 1.0
                clockPointView.center = edge
                
                angle2Date(isInside: (len < clockOuterView.frame.width/2 - 40),
                           angle:getAngle(a:clockCenterPoint, b:CGPoint(x:clockCenterPoint.x + axlen, y:clockCenterPoint.y - aylen)))
            }
        }
        
        func getAngle(a:CGPoint, b:CGPoint) -> Double {
            var r:Double = Double(atan2(b.y - a.y, b.x - a.x))
            if r < 0 { r = r + 2 * Double.pi }
            return floor(r * 360 / (2 * Double.pi))
        }
        
        func angle2Date(isInside:Bool, angle:Double) -> Void {

            if hourButton.isSelected {
                if is24Hour {
                    var index:String = String(Int(round((angle + 90).truncatingRemainder(dividingBy:360) / 30)))
                    if isInside {
                        if index == "0" { index = "12" }
                    } else {
                        if index == "12" || index == "0" { index = "00" }
                        else { index = String(Int(index)! + 12) }
                    }
                    hourButton.setTitle(index, for: .normal)
                } else {
                    var index:String = String(Int(round((angle + 90).truncatingRemainder(dividingBy:360) / 30)))
                    if index == "0" { index = "12" }
                    hourButton.setTitle(index, for: .normal)
                }
            } else {
                var index:String = String(format: "%02d", Int(round((angle + 90).truncatingRemainder(dividingBy:360) / 6)))
                if index == "60" { index = "00" }
                minButton.setTitle(index, for: .normal)
            }
        }
        
        func hour2Clock() -> Void {
            let radius:CGFloat = clockOuterView.frame.width/2
            let clockLength:CGFloat = (Double((hourButton.titleLabel?.text)!)! > 12 || Double((hourButton.titleLabel?.text)!)! == 0 || !self.is24Hour) ? radius : radius - 60
            let num:Double = Double((hourButton.titleLabel?.text)!)!.truncatingRemainder(dividingBy:12)
            let angle:CGFloat = CGFloat(num * 30) - 90
            let xPos:CGFloat = cos(angle/180 * CGFloat.pi) * clockLength + radius
            let yPos:CGFloat = sin(angle/180 * CGFloat.pi) * clockLength + radius
            drawClockLine(centerPoint: CGPoint(x:radius, y:radius) , touchPoint: CGPoint(x:xPos, y:yPos))
        }
        
        func min2Clock() -> Void {
            let radius:CGFloat = clockOuterView.frame.width/2
            let angle:CGFloat = CGFloat(Double((minButton.titleLabel?.text)!)! * 6) - 90
            let xPos:CGFloat = (cos(angle/180 * CGFloat.pi) + 1) * (radius)
            let yPos:CGFloat = (sin(angle/180 * CGFloat.pi) + 1) * (radius)
            drawClockLine(centerPoint: CGPoint(x:radius, y:radius) , touchPoint: CGPoint(x:xPos, y:yPos))
        }
        
        func doneDown(sender: UIButton!) -> Void {
            let a:String = (is24Hour) ? "" : ampmLabel.text!
            let res:(Int, Int, String) = (Int((hourButton.titleLabel?.text)!)!, Int((minButton.titleLabel?.text)!)!, a)
            if doneAction!(messageLabel, res) { buttonDown(sender: sender) }
            else {
                resizeParts()
                if hourButton.isSelected { hour2Clock() }
                else { min2Clock() }
            }
        }
        
        func cancelDown(sender: UIButton!) -> Void {
            buttonDown(sender: sender)
        }
        
        private func buttonDown(sender: UIButton!) -> Void {
            //Dissmiss alert
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: UIViewAnimationOptions.curveLinear,
                           animations: { () -> Void in
                            self.view.alpha = 0
                },
                           completion: { (finished:Bool) -> Void in
                            self.view.removeFromSuperview()
                            let cnt:Int = 0;
                            for vc:UIViewController in _PKPickerStack.vcCollection {
                                if (vc == self){
                                    _PKPickerStack.vcCollection.remove(at: cnt)
                                    break;
                                }
                                
                            }
            })
        }
        
        func rotate() -> Void {
            let point:CGPoint = UIApplication.shared.windows[0].center
            if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation))
            {
                clockView.center = point
            }
            
            if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation))
            {
                clockView.center = point
            }
        }
    }

    class PKCheckButton: UIButton {
        var isOn:Bool = false
        var isMulti:Bool = false
        private let baseColor:UIColor = UIColor.lightGray
        private let frameShapeLayer:CAShapeLayer = CAShapeLayer()
        private let checkShapeLayer:CAShapeLayer = CAShapeLayer()
        private let framePath:UIBezierPath = UIBezierPath()
        private let checkPath:UIBezierPath = UIBezierPath()
        private let margin:CGFloat = 16
        private let lineWidth:CGFloat = 2
        
        convenience init(isMulti m: Bool, color c:UIColor) {
            self.init()
            isMulti = m
            tintColor = c
            layer.addSublayer(frameShapeLayer)
            layer.addSublayer(checkShapeLayer)
        }
        
        override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            if isMulti {
                framePath.move(to: CGPoint(x:margin, y:margin))
                framePath.addLine(to: CGPoint(x:margin, y:self.frame.height - margin))
                framePath.addLine(to: CGPoint(x:self.frame.height - margin, y:self.frame.height - margin))
                framePath.addLine(to: CGPoint(x:self.frame.height - margin, y:margin))
                framePath.addLine(to: CGPoint(x:margin - lineWidth/2, y:margin))
                framePath.stroke()
            } else {
                framePath.addArc(withCenter: CGPoint(x:self.frame.height/2, y:self.frame.height/2),
                                 radius: self.frame.height - margin*2 - 6,
                                 startAngle: 0,
                                 endAngle: CGFloat.pi * 2,
                                 clockwise: true)
                framePath.stroke()
            }
            frameShapeLayer.path = framePath.cgPath
            frameShapeLayer.strokeColor = baseColor.cgColor
            frameShapeLayer.fillColor = UIColor.clear.cgColor
            frameShapeLayer.lineWidth = lineWidth
            //layer.addSublayer(frameShapeLayer)
            
            if isMulti {
                checkPath.move(to: CGPoint(x:margin + 2, y:self.frame.height/2 - 2))
                checkPath.addLine(to: CGPoint(x:self.frame.height/2, y:self.frame.height/2 + 2))
                checkPath.addLine(to: CGPoint(x:self.frame.height - margin + 2, y:margin - 2))
                checkPath.stroke(with: CGBlendMode.clear, alpha: 0)
                checkShapeLayer.strokeColor = tintColor.cgColor
                checkShapeLayer.fillColor = UIColor.clear.cgColor
            } else {
                checkPath.addArc(withCenter: CGPoint(x:self.frame.height/2, y:self.frame.height/2),
                                 radius: self.frame.height - margin*2 - 9,
                                 startAngle: 0,
                                 endAngle: CGFloat.pi * 2,
                                 clockwise: true)
                checkPath.fill(with: CGBlendMode.clear, alpha: 0)
                checkShapeLayer.strokeColor = UIColor.clear.cgColor
                checkShapeLayer.fillColor = tintColor.cgColor
            }
            checkShapeLayer.path = checkPath.cgPath
            checkShapeLayer.lineWidth = lineWidth
            //layer.addSublayer(checkShapeLayer)
            checkShapeLayer.isHidden = true
        }
        
        func on(){
            setTitleColor(tintColor, for: .normal)
            frameShapeLayer.strokeColor = tintColor.cgColor
            checkShapeLayer.isHidden = false
            isOn = true
        }
        
        func off(){
            setTitleColor(baseColor, for: .normal)
            frameShapeLayer.strokeColor = baseColor.cgColor
            checkShapeLayer.isHidden = true
            isOn = false
        }
        
        func toggle(){
            if isOn { off() }
            else { on() }
        }
        
    }
}

<img src="https://img.shields.io/badge/version-v0.1-green.svg"> <img src="https://img.shields.io/badge/license-MIT-lightgray.svg"> <img src="https://img.shields.io/badge/Target-iOS8%20or%20later-blue.svg">  

PKPicker
==============
Simple and customizable picker functions in Swift.  

- List  
- Drum  
- Date  
- Clock (Android style)  

# Set up

Add `PKPicker/PKPicker.swift` into your project.  
There is a global variable named `PKPicker`. Use the variable and call methods.  

## Common Configration

```swift
PKPicker.tintColor:UIColor        // default: UIColor(colorLiteralRed: 0, green: 122/255, blue: 1, alpha: 1)
PKPicker.titleFontColor:UIColor   // default: UIColor.darkGray
PKPicker.titleFontStyle:UIFont    // default: UIFont.boldSystemFont(ofSize: 17)
PKPicker.messageFontColor:UIColor // default: UIColor.gray
PKPicker.messageFontStyle:UIFont  // default: UIFont.systemFont(ofSize: 13)
PKPicker.buttonFontColor:UIColor  // default: UIColor.gray
PKPicker.backgroundColor:UIColor  // default: UIColor.white
PKPicker.doneButtonText:String    // default: "Done"
PKPicker.cancelButtonText:String  // default: "Cancel"
PKPicker.width:CGFloat            // default: 300
```


## ListPicker

#### Single

<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/listsingle00.png">

```swift
PKPicker.list(title: "Interest",
              items: ["Art", "Music", "Sports", "Travel"],
              defaultSelected: [1],
              allowMulti: false,
              action: {(m, obj) -> Bool in
                return true
            }
)
```

#### Multi

<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/listmulti00.png">
<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/listmulti01.png">

```swift
PKPicker.list(title: "Interest",
              items: ["Art", "Music", "Sports", "Travel"],
              defaultSelected: [1],
              allowMulti: true,
              action: {(m, obj) -> Bool in
                if obj.count == 0 {
                    m?.text = "Select at least one."
                    m?.textColor = UIColor.red
                    return false
                }
                return true
            }
)
```

## DrumPicker

<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/drum00.png">
<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/drum01.png">

```swift
let arr1 = ["T-shirts", "Parker", "Shoes", "Hat", "Bag"]
let arr2 = ["0", "1", "2", "3"]
let itemsArr:[[String]] = [arr1, arr2]
PKPicker.drum(title: "Item",
                items: itemsArr,
                defaultSelected: [0, 0],
                action: {(m, obj) -> Bool in
                    m?.text = "Sorry this item is sold out."
                    m?.textColor = UIColor.red
                    return false

                }
)
```

## DatePicker

<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/date00.png">
<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/date01.png">

```swift
PKPicker.date(title: "Date",
              format: UIDatePickerMode.dateAndTime,
              defaultSelected: Date(),
              action: { (m, d) -> Bool in
                if NSDate().compare(d) == ComparisonResult.orderedAscending{
                    m?.text = "Pick past date."
                    m?.textColor = UIColor.red
                    return false
                }
                return true
              }
)
```

## ClockPicker

#### AM / PM

<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/clock00.png">
<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/clock01.png">

```swift
PKPicker.clock(title: "Start time",
               twentyFourHour: false,
               defaultSelected: (8, 12, "AM"),
               action: { (m, d) -> Bool in
                if d.0 < 7 && d.2 == "AM" {
                    m?.text = "Too early to start."
                    m?.textColor = UIColor.red
                    return false
                }
                return true
    }
)
```

#### 24 Hour 

<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/clock2400.png">
<img src="https://raw.githubusercontent.com/hakopako/PKPicker/master/images/clock2401.png">

```swift
PKPicker.clock(title: "Start time",
               twentyFourHour: true,
               defaultSelected: (8, 12, ""),
               action: { (m, d) -> Bool in
                if d.0 < 7 {
                    m?.text = "Too early to start."
                    m?.textColor = UIColor.red
                    return false
                }
                return true
    }
)
```








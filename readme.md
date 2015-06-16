# Apple Watch workshop

---

# Apple Watch

![inline](watch.png)

- Lansert 24. april i Australia, Canada, China, France, Germany, Hong Kong, Japan, UK & USA
- Følger mange av de samme design patterns som for vanlig iOS-utvikling

---

- Klokkebank for Apple Watch

![inline](klokkebank.png)

---

# Komponenter

- Apps, notifikasjoner, glance, complication

---

# Apps

- Hieraktisk eller page-based

![inline](hierarchical.mp4)

![inline](page-based.mp4)

---

# Notifications

- Out of the box -støtte 
- iPhone bestemmer om notifikasjon vises på klokke eller mobil
- Action buttons

---

# Glance

- “A glance is a focused interface that you use to display your app’s most important information.” (developer.apple.com)
- OnClick launch app

![inline](glance.png)

---

# Complications via ClockKit framework

![inline](complications.png)

---

![inline](watchkitVSuikit.png)

---

# Arkitektur

![inline](watchkit.png)

---

# Watch OS2

![inline](newarkitektur.png)

---

# Watch OS2

- Native apps

![inline](spinner.png)

- Nye tilganger som haptic feedback, digital crown, sensors via HealthKit

---	

# DEPRECATED

- Shared app group
	- NSUserDefaults eller filer
- iOS frameworks som f.eks CloudKit
- https://developer.apple.com/library/prerelease/watchos/documentation/General/Conceptual/AppleWatch2TransitionGuide/index.html

---

# Kommunikasjon

- Direkte via closures syntax
	- Open Parent Application
	- AppDelegate får request og responderer
- Watch Connectivity framework

```swift

```


---


# Resources
- https://developer.apple.com/watch/human-interface-guidelines/
- https://developer.apple.com/library/ios/documentation/General/Conceptual/WatchKitProgrammingGuide/index.html

---

# Oppgaver 

- Todo-app for Apple Watch

--- 

# Prosjekt

Oppsett følg guide

https://developer.apple.com/library/ios/documentation/General/Conceptual/WatchKitProgrammingGuide/ConfiguringYourXcodeProject.html


eller last ned boilerplate prosjekt:

git@github.com:Lomaas/boilerplate.git

---

# Vis todo's

![inline](finishedproduct.png)

https://developer.apple.com/library/ios/documentation/General/Conceptual/WatchKitProgrammingGuide/Tables.html

---

# Start

- Start i Interface.storyboard hvor grensesnittet defineres
- Dra inn tableView

![inline50%](storyboardlocation.png)

- Konfiguer table row etter ønske. F. eks en tittel label, dato label og et bilde


---

# TableView - storyboard


![inline](tableview.png) 

- Husk å sette identifier string og custom klasse for TableRowController

---

# Custom row

![inline](connectoutlet.png)

ctrl-click label og drag inn i TodoRowController
 
---

# Configure TableView

1. Create some fake data
2. Set number of rows and configure each row controller

```swift
tableView.setNumberOfRows..
let row = tableView.rowControllerAtIndex...
```

---

# Complete task

- Implementer

```swift
   func table(_ table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
```

---

# Legg til force touch

- Legg til ny todo når bruker longpresser

![inline](force-touch.mp4)

---

# Complication

- Legg til todo som er kortest til basert på dato som complication (komponent på watchface)
- Bonus støtt timeline.  
- https://developer.apple.com/library/prerelease/watchos/documentation/ClockKit/Reference/ClockKit_framework/index.html

![inline](complications.png)


---
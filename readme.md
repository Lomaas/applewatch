
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

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/finishedproduct.png?raw=true)

- https://developer.apple.com/library/ios/documentation/General/Conceptual/WatchKitProgrammingGuide/Tables.html

---

# Start

- Start i Interface.storyboard hvor grensesnittet defineres
- Dra inn tableView

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/storyboardlocation.png?raw=true)

- Konfiguer table row etter ønske. F. eks en tittel label, dato label og et bilde


---

# TableView - storyboard
 
![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/tableview.png?raw=true)

- Husk å sette identifier string og custom klasse for TableRowController

---

# Custom row

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/connectoutlet.png?raw=true)

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

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/force-touch.mp4?raw=true)

---

# Complication

- Legg til todo som er kortest til basert på dato som complication (komponent på watchface)
- Bonus støtt timeline.  
- https://developer.apple.com/library/prerelease/watchos/documentation/ClockKit/Reference/ClockKit_framework/index.html

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/complications.png?raw=true)

---

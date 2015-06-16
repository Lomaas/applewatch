
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

ctrl-click label og dra inn i TodoRowController
 
---

# Configure TableView

1. Lag noe fake data for å teste presentasjonen av dataen 
2. Sett antall rader og konfigurer hver rad med metodene nedenfor

```swift
tableView.setNumberOfRows..
let row = tableView.rowControllerAtIndex...
```

---

# Complete task

- Implementer didSelectRowAtIndex for å håndtere klikk på en row

```swift
   func table(_ table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
```

---

# Complication

- Legg til todo som er kortest tid til basert på dato som complication (komponent på watchface)
- Bonus: støtt timeline.
- https://developer.apple.com/library/prerelease/watchos/documentation/ClockKit/Reference/ClockKit_framework/index.html

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/complications.png?raw=true)

---

# Kommunikasjon med iPhone

- Send beskjed til iPhone app når bruker fullfører en todo får å synce state

---

# Legg til force touch

- Finn på en action og implementer ved bruk av force-touch

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/force-touch.mp4?raw=true)

---


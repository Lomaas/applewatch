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

https://github.com/Lomaas/applewatch


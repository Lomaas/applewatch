
---

# Resources
- https://developer.apple.com/watch/human-interface-guidelines/
- https://developer.apple.com/library/ios/documentation/General/Conceptual/WatchKitProgrammingGuide/index.html

---

# Oppgaver 

- Todo-app for Apple Watch
--- 

# Prosjekt

1. Åpne XCode
2. Create new project
3. Under watchOS, velg Application og så iOS App with WatchKit App
4. Velg navn, la resten være urørt. Alt kan endres senere

Oppsett for eksisterende prosjekt:

https://developer.apple.com/library/ios/documentation/General/Conceptual/WatchKitProgrammingGuide/ConfiguringYourXcodeProject.html

eller last ned dette prosjektet som har basic setup

App kjøres ved å velge WatchKit App build scheme:

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/runapp1.png?raw=true)

---

# 1: Vis todo's i en tabell

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

---

- Husk å sette identifier string og custom klasse for TableRowController

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/rowidentifier.png?raw=true)

# Custom row

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/connectoutlet.png?raw=true)

- ctrl-click label og dra inn i TodoRowController
- Alle interface objekter som er definert i Storyboard kan du få en referanse til (IBOutlet) til ved å ctrl-click og så drag inn i klasser. 

---

# Configure TableView

1. Lag noe fake data for å teste presentasjonen av dataen 
2. Sett antall rader og konfigurer hver rad med rowControllerAtIndex

```swift
tableView.setNumberOfRows..
let row = tableView.rowControllerAtIndex(...)
```

PS: Du må ctrl-click og dra en tableView referanse inn i InterfaceController. Det er denne variabelen du bruker i koden ovenfor

---

# 2: Complete task

- Implementer didSelectRowAtIndex for å håndtere klikk på en row
- Fullfør Todo ved å fjerne todoen fra tabell og refresh GUI

```swift
   func table(_ table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
```

- Bonus: Gjør det samme bare med en UIButton definert i hver row
Tips: ctrl-click & dra inn i custom row -klasse, velg action (IBAction) istedet for IBOutlet

---

# 3: Kommunikasjon med iPhone

- Send todos fra iPhone istedet for å hardkode i Watch-app
- Send beskjed til iPhone app fra Watch når bruker fullfører en todo får å synce state
- Lagre Todo's i iOS-app med NSUserdefaults
- På Watch kan man motta data fra iPhone app med WCSession og delegation pattern. Hvis iPhone app allerede har sendt ny fresh data vil man kunne hente den dataen rett i awakeWithContext i WKInterfaceController

- Eksempel
```swift
let session = WCSession.defaultSession()
session.delegate = self
session.activateSession()

```

- Implementer delegate:

```swift
func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
	// Do something with userInfo
}

```

- For å sende data fra iOS app:

```swift
let session = WCSession.defaultSession()
session.activateSession()
session.transferUserInfo(["test" : "hello"])
```

---

# 4, 5, 6 kan gjøres uavhengig av rekkefølge

# 4: Complication

- Legg til todo som er kortest tid til basert på dato som complication (komponent på watchface)
- Bonus: støtt timeline.
- https://developer.apple.com/library/prerelease/watchos/documentation/ClockKit/Reference/ClockKit_framework/index.html

![alt tag](https://github.com/Lomaas/boilerplate/blob/master/presentasjonoppgaver/complications.png?raw=true)

---

# 5: Legg til force touch

- Finn på en action og implementer ved bruk av force-touch
- Hjelpekilde:

https://developer.apple.com/library/ios/documentation/General/Conceptual/WatchKitProgrammingGuide/Menus.html

---

# 6: Notifikasjon

- Lag og send notifikasjon når det er en time igjen til tidsfrist for Todo går ut
- Kode for å registere iOS appen for å bruke notifikasjon. Edit action1 eller legg til flere for flere actions på notifikasjon

```swift
let notificationSettings: UIUserNotificationSettings! = UIApplication.sharedApplication().currentUserNotificationSettings()

if (notificationSettings.types != UIUserNotificationType.None){
    return
}

let action1 = UIMutableUserNotificationAction()
action1.activationMode = UIUserNotificationActivationMode.Background
action1.title = "Complete"
action1.identifier = notificationActionOneIdent
action1.destructive = false
action1.authenticationRequired = false

let actionCategory = UIMutableUserNotificationCategory()
actionCategory.identifier = notificationCategoryIdent
actionCategory.setActions([action1], forContext: UIUserNotificationActionContext.Minimal)

let categories = NSSet(object: actionCategory)
let types = UIUserNotificationType.Alert | UIUserNotificationType.Sound

let settings = UIUserNotificationSettings(forTypes: types, categories: categories as Set<NSObject>)
UIApplication.sharedApplication().registerUserNotificationSettings(settings)
```

- For å lage notifikasjon brukes UILocalNotification:

```swift
let notification = UILocalNotification()
// Set alertbody, alerttitle, firedate,

UIApplication.sharedApplication().scheduleLocalNotification(notification)


```

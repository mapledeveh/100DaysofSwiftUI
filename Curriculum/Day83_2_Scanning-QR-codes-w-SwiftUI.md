# Scanning QR codes with SwiftUI

Scanning a QR code – or indeed any kind of visible code such as barcodes – can be done by Apple’s AVFoundation library. This doesn’t integrate into SwiftUI terribly smoothly, so to skip over a whole lot of pain I’ve packaged up a QR code reader into a Swift package that we can add and use directly inside Xcode.

My package is called CodeScanner, and its available on GitHub under the MIT license at https://github.com/twostraws/CodeScanner – you’re welcome to inspect and/or edit the source code if you want. Here, though, we’re just going to add it to Xcode by following these steps:

1. Go to File > Swift Packages > Add Package Dependency.
2. Enter https://github.com/twostraws/CodeScanner as the package repository URL.
3. For the version rules, leave “Up to Next Major” selected, which means you’ll get any bug fixes and additional features but not any breaking changes.
4. Press Finish to import the finished package into your project.

The CodeScanner package gives us one **CodeScanner** SwiftUI view to use, which can be presented in a sheet and handle code scanning in a clean, isolated way. I know I keep repeating myself, but I hope you can see the continuing theme: the best way to write SwiftUI is to isolate functionality in discrete methods and wrappers, so that all you expose to your SwiftUI layouts is clean, clear, and unambiguous.

We already have a “Scan” button in **ProspectsView**, and we’re going to use that trigger QR scanning. So, start by adding this new **@State** property to **ProspectsView**:
```
@State private var isShowingScanner = false
```
Earlier we added some test functionality to the “Scan” button so we could insert some sample data, but we don’t need that any more because we’re about to scan real QR codes. So, replace the action code for the toolbar button with this:
```
isShowingScanner = true
```
When it comes to handling the result of the QR scanning, I’ve made the CodeScanner package do literally all the work of figuring out what the code is and how to send it back, so all we need to do here is catch the result and process it somehow.

When the **CodeScannerView** finds a code, it will call a completion closure with a **Result** instance either containing details about the code that was found or an error saying what the problem was – perhaps the camera wasn’t available, or the camera wasn’t able to scan codes, for example. Regardless of what code or error comes back, we’re just going to dismiss the view; we’ll add more code shortly to do more work.

Start by adding this new import near the top of ProspectsView.swift:
```
import CodeScanner
```
Now add this method to **ProspectsView**:
```
func handleScan(result: Result<ScanResult, ScanError>) {
   isShowingScanner = false
   // more code to come
}
```
Before we show the scanner and try to handle its result, we need to ask the user for permission to use the camera:

1. Go to your target’s configuration options under its Info tab.
2. Right-click on an existing key and select Add Row.
3. Select “Privacy - Camera Usage Description” for the key.
4. For the value enter “We need to scan QR codes.”

And now we’re ready to scan some QR codes! We already have the **isShowingScanner** state that determines whether to show a code scanner or not, so we can now attach a **sheet()** modifier to present our scanner UI.

Creating a **CodeScanner** view takes three parameters:

1. An array of the types of codes we want to scan. We’re only scanning QR codes in this app so **[.qr]** is fine, but iOS supports lots of other types too.
2. A string to use as simulated data. Xcode’s simulator doesn’t support using the camera to scan codes, so **CodeScannerView** automatically presents a replacement UI so we can still test that things work. This replacement UI will automatically send back whatever we pass in as simulated data.
3. A completion function to use. This could be a closure, but we just wrote the **handleScan()** method so we’ll use that.

So, add this below the existing **toolbar()** modifier in **ProspectsView**:
```
.sheet(isPresented: $isShowingScanner) {
    CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: handleScan)
}
```
That’s enough to get most of this screen working, but there is one last step: replacing the **// more code to come** comment in **handleScan()** with some actual functionality to process the data we found.

If you recall, the QR codes we’re generating are a name, then a line break, then an email address, so if our scanning result comes back successfully then we can pull apart the code string into those components and use them to create a new **Prospect**. If code scanning failed, we’ll just print an error – you’re welcome to show some more interesting UI if you want!

Replace the **// more code to come** comment with this:
```
switch result {
case .success(let result):
    let details = result.string.components(separatedBy: "\n")
    guard details.count == 2 else { return }

    let person = Prospect()
    person.name = details[0]
    person.emailAddress = details[1]

    prospects.people.append(person)
case .failure(let error):
    print("Scanning failed: \(error.localizedDescription)")
}
```
Go ahead and run the code now. If you’re using the simulator you’ll see a test UI appear, and tapping anywhere will dismiss the view and send back our simulated data. If you’re using a real device you’ll see a permission message asking the user to allow camera use, and you grant that you’ll see a scanner view. To test out scanning on a real device, simultaneously launch the app in the simulator and switch to the Me tab – your phone should be able to scan the simulator screen on your computer.
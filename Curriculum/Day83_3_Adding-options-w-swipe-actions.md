# Adding options with swipe actions

We need a way to move people between the Contacted and Uncontacted tabs, and the easiest thing to do is add a swipe action to the **VStack** in **ProspectsView**. This will allow users to swipe on any person in the list, then tap a single option to move them between the tabs.

Now, remember that this view is shared in three places, so we need to make sure the swipe actions look correct no matter where it’s used. We *could* try and use a bunch of ternary conditional operators, but later on we’ll add a second button so the ternary operator approach won’t really help much. Instead, we’ll just wrap the button inside a simple condition – add this to the **VStack** now:
```
.swipeActions {
    if prospect.isContacted {
        Button {
            prospect.isContacted.toggle()
        } label: {
            Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
        }
        .tint(.blue)
    } else {
        Button {
            prospect.isContacted.toggle()
        } label: {
            Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
        }
        .tint(.green)
    }
}
```
While the text for that is OK and the context menu displays correctly, the action doesn’t do anything. Well, that’s not strictly true: it does toggle the Boolean, but it doesn’t actually update the UI.

This problem occurs because the **people** array in **Prospects** is marked with **@Published**, which means if we add or remove items from that array a change notification will be sent out. However, if we quietly change an item inside the array then SwiftUI won’t detect that change, and no views will be refreshed.

To fix this, we need to tell SwiftUI by hand that something important has changed. So, rather than flipping a Boolean in **ProspectsView**, we are instead going to call a method on the **Prospects** class to flip that same Boolean while also sending a change notification out.

Start by adding this method to the **Prospects** class:
```
func toggle(_ prospect: Prospect) {
    objectWillChange.send()
    prospect.isContacted.toggle()
}
```
Important: You should call **objectWillChange.send()** before changing your property, to ensure SwiftUI gets its animations correct.

Now you can replace the **prospect.isContacted.toggle()** action with this:
```
prospects.toggle(prospect)
```
If you run the app now you’ll see it works much better – scan a user, then bring up the context menu and tap its action to see the user move between the Contacted and Uncontacted tabs.

We could leave it there, but there’s one more change I want to make. As you saw, changing **isContacted** directly causes problems, because although the Boolean has changed internally our UI has become stale. If we leave our code as-is, it’s possible we (or other developers) might forget about this problem and try to flip the Boolean directly from elsewhere, which will just cause more bugs.

Swift can help us mitigate this problem by stopping us from modifying the Boolean outside of Prospects.swift. There’s a specific access control option called **fileprivate**, which means “this property can only be used by code inside the current file.” Of course, we still want to read that property, and so we can deploy another useful Swift feature: **fileprivate(set)**, which means “this property can be read from anywhere, but only *written* from the current file” – the exact combination we need to make sure the Boolean is safe to use.

So, modify the **isContacted** Boolean in **Prospect** to this:
```
fileprivate(set) var isContacted = false
```
It hasn’t affected our project here, but it does help keep us safe in the future. If you were wondering why we put the **Prospect** and **Prospects** classes in the same file, now you know!
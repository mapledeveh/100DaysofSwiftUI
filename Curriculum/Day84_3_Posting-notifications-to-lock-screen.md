# Posting notifications to the lock screen

For the final part of our app, we’re going to add another button to our list swipe actions, letting users opt to be reminded to contact a particular person. This will use iOS’s UserNotifications framework to create a local notification, and we’ll conditionally include it in the swipe actions as part of our existing **if** check – the button will only be shown if the user hasn’t been contacted already.

Much more interesting is how we schedule the local notifications. Remember, the first time we try this we need to use **requestAuthorization()** to explicitly ask for permission to show a notification on the lock screen, but we also need to be careful subsequent times because the user can retroactively change their mind and disable notifications.

One option is to call **requestAuthorization()** every time we want to post a notification, and honestly that works great: the first time it will show an alert, and all other times it will immediately return success or failure based on the previous response.

However, in the interests of completion I want to show you a more powerful alternative: we can request the current authorization settings, and use that to determine whether we should schedule a notification or request permission. The reason it’s helpful to use this approach rather than just requesting permission repeatedly, is that the settings object handed back to us includes properties such as **alertSetting** to check whether we can show an alert or not – the user might have restricted this so all we can do is display a numbered badge on our icon.

So, we’re going to call **getNotificationSettings()** to read whether notifications are currently allowed. If they are, we’ll show a notification. If they aren’t, we’ll request permissions, and if that comes back successfully then we’ll also show a notification. Rather than repeat the code to schedule a notification, we’ll put it inside a closure that can be called in either scenario.

Start by adding this import near the top of ProspectsView.swift:
```
import UserNotifications
```
Now add this method to the **ProspectsView** struct:
```
func addNotification(for prospect: Prospect) {
    let center = UNUserNotificationCenter.current()

    let addRequest = {
        let content = UNMutableNotificationContent()
        content.title = "Contact \(prospect.name)"
        content.subtitle = prospect.emailAddress
        content.sound = UNNotificationSound.default

        var dateComponents = DateComponents()
        dateComponents.hour = 9
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }

    // more code to come
}
```
That puts all the code to create a notification for the current prospect into a closure, which we can call whenever we need. Notice that I’ve used **UNCalendarNotificationTrigger** for the trigger, which lets us specify a custom **DateComponents** instance. I set it to have an hour component of 9, which means it will trigger the next time 9am comes about.

**Tip:** For testing purposes, I recommend you comment out that trigger code and replace it with the following, which shows the alert five seconds from now:
```
let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
```
For the second part of that method we’re going to use both **getNotificationSettings()** and **requestAuthorization()** together, to make sure we only schedule notifications when allowed. This will use the **addRequest** closure we defined above, because the same code can be used if we have permission already or if we ask and have been granted permission.

Replace the **// more code to come** comment with this:
```
center.getNotificationSettings { settings in
    if settings.authorizationStatus == .authorized {
        addRequest()
    } else {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                addRequest()
            } else {
                print("D'oh")
            }
        }
    }
}
```
That’s all the code we need to schedule a notification for a particular prospect, so all that remains is to add an extra button to our swipe actions – add this below the “Mark Contacted” button:
```
Button {
    addNotification(for: prospect)
} label: {
    Label("Remind Me", systemImage: "bell")
}
.tint(.orange)
```
That completes the current step, and completes our project too – try running it now and you should find that you can add new prospects, then press and hold to either mark them as contacted, or to schedule a contact reminder.

Good job!


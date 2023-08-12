# Improving our map annotations

Right now we’re using **MapMarker** to place locations in our **Map** view, but SwiftUI lets us place any kind of view on top of our map so we can have complete customizability. So, we’re going to use that to show a custom SwiftUI view containing an icon and some text to show the location’s name, then take a look at the underlying data type to see what improvements can be made there.

Thanks to the brilliance of SwiftUI, this takes hardly any code at all – replace your existing **MapMarker** code with this:
```
MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
    VStack {
        Image(systemName: "star.circle")
            .resizable()
            .foregroundColor(.red)
            .frame(width: 44, height: 44)
            .background(.white)
            .clipShape(Circle())

        Text(location.name)
    }
}
```
That’s already an immediate improvement, because now it’s clear what each marker represents – the location name appears directly underneath. However, I want to look beyond just the SwiftUI view: I want to look at the **Location** struct itself, and apply a few improvements that make it better.

First, I don’t particularly like having to make a **CLLocationCoordinate2D** inside our SwiftUI view, and I’d much prefer to move that kind of logic inside our **Location** struct. So, we can move that into a computed property to clean up our code. First, add an import for MapKit into Location.swift, then add this to **Location**:
```
var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
}
```
Now our **ContentView** code is simpler:
```
MapAnnotation(coordinate: location.coordinate) {
```
The second change I want to make is one I encourage everyone to make when building custom data types for use with SwiftUI: add an example! This makes previewing significantly easier, so where possible I would encourage you to add a static **example** property to your types containing some sample data that can be previewed well.

So, add this second property to **Location** now:
```
static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Where Queen Elizabeth lives with her dorgis.", latitude: 51.501, longitude: -0.141)
```
The last change I’d like to make here is to add a custom **==** function to the struct. We already made **Location** conform to **Equatable**, which means we can already compare one location to another using **==**. Behind the scenes, Swift will write this function for us by comparing every property against every other property, which is rather wasteful – all our locations already have a unique identifier, so if two locations have the same identifier then we can be sure they are the same without also checking the other properties.

So, we can save a bunch of work by writing our own **==** function to **Location**, which compares two identifiers and nothing else:
```
static func ==(lhs: Location, rhs: Location) -> Bool {
    lhs.id == rhs.id
}
```
I’m a huge fan of making structs conform to **Equatable** as standard, even if you can’t use an optimized comparison function like above – structs are simple values like strings and integers, and I think we should extend that same status to our own custom structs too.

With that in place the next step of our project is complete, so please run it now – you should be able to drop a marker and see our custom annotation, but now behind the scenes know that our code is a little bit neater too!
# Integrating MapKit with SwiftUI

Maps have been a core feature of iPhone since the very first device shipped way back in 2007, and the underlying framework has been available to developers for almost as long. Even better, Apple provides a SwiftUI **Map** view that wraps up the underlying map framework beautifully, letting us place maps, annotations, and more alongside the rest of our SwiftUI view hierarchy.

Let’s start with something simple: showing a map means creating some program state that stores the map’s current center coordinate and zoom level, which is handled through a dedicated type called **MKCoordinateRegion**. The “MK” in that name means this come from Apple’s MapKit framework, so our first step is to import that framework:
```
import MapKit 
```
Now we can make a property such as this one:
```
@State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
```
That centers on the city of London. Both sets of latitude and longitude are measured in degrees, but in practice longitude changes in its underlying value as you move further away from the equator so it might take a little experimentation to find a starting value you like.

Finally, we can add a map view like this:
```
Map(coordinateRegion: $mapRegion)
```
That has a two-way binding to the region so it can be updated as the user moves around the map, and when the app runs you should see London right there on your map.

There are a variety of extra options we can use when creating maps, but by far the most important is the ability to add annotations to the map – markers that represent various places of our choosing.

To do this takes at least three steps depending on your goal: defining a new data type that contains your location, creating an array of those containing all your locations, then adding them as annotations in the map. Whatever new data type you create to store locations, it must conform to the **Identifiable** protocol so that SwiftUI can identify each map marker uniquely.

For example, we might start with this kind of **Location** struct:
```
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
```
Now we can go ahead and define an array of locations, wherever we want map annotations to appear:
```
let locations = [
    Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
    Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
]
```
Step three is the important part: we can feed that array of locations into the **Map** view, as well as providing a function that transforms one location into a visible annotation on the map. SwiftUI provides us with a couple of different annotation types, but the simplest is **MapMarker**: a simple balloon with a latitude/longitude coordinate attached.

For example, we could place markers at both our locations like so:
```
Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
    MapMarker(coordinate: location.coordinate)
}
```
When that runs you’ll see two red balloons on the map, although they don’t show any useful information – our locations don’t have their name visible, for example. To add that extra information we need to create a wholly custom view using a different annotation type, helpfully just called **MapAnnotation**. This accepts the same coordinate as **MapMarker**, except rather than just showing a system-style balloon we instead get to pass in whatever custom SwiftUI views we want.

So, we could replace the balloons with stroked red circles like this:
```
Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
    MapAnnotation(coordinate: location.coordinate) {
        Circle()
            .stroke(.red, lineWidth: 3)
            .frame(width: 44, height: 44)
    }
}
```
Once you’re using **MapAnnotation** you can pass in any SwiftUI views you want – it’s a great customization point, and can include any interactivity you want.

For example, we could add a tap gesture to our annotations like this:
```
MapAnnotation(coordinate: location.coordinate) {
    Circle()
        .stroke(.red, lineWidth: 3)
        .frame(width: 44, height: 44)
        .onTapGesture {
            print("Tapped on \(location.name)")
        }
}
```
We could even place a **NavigationLink** into our map annotation, directing the user to a different view when the annotation was tapped:
```
NavigationView {
    Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
        MapAnnotation(coordinate: location.coordinate) {
            NavigationLink {
                Text(location.name)
            } label: {
                Circle()
                    .stroke(.red, lineWidth: 3)
                    .frame(width: 44, height: 44)
            }
        }
    }
    .navigationTitle("London Explorer")
}
```
The point is that you get to decide whether you want something simple or something more advanced, then add any interactivity using all the SwiftUI tools and techniques you already know.


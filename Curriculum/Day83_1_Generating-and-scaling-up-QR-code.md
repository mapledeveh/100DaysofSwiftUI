# Generating and scaling up a QR code

Core Image lets us generate a QR code from any input string, and do so extremely quickly. However, there’s a problem: the image it generates is very small because it’s only as big as the pixels required to show its data. It’s trivial to make the QR code larger, but to make it look good we also need to adjust SwiftUI’s image interpolation. So, in this step we’re going to ask the user to enter their name and email address in a form, use those two pieces of information to generate a QR code identifying them, and scale up the code without making it fuzzy.

We already have a simple **MeView** struct that we made as a placeholder earlier, so our first job will be to add a couple of text fields and their string bindings.

First, add these two new pieces of state to hold a name and email address:
```
@State private var name = "Anonymous"
@State private var emailAddress = "you@yoursite.com"
```
When it comes to the body of the view we’re going to use two text fields with large fonts, but this time we’re going to attach a small but useful modifier to the text fields called **textContentType()** – it tells iOS what kind of information we’re asking the user for. This should allow iOS to provide autocomplete data on behalf of the user, which makes the app nicer to use.

Replace your current body with this:
```
NavigationView {
    Form {
        TextField("Name", text: $name)
            .textContentType(.name)
            .font(.title)

        TextField("Email address", text: $emailAddress)
            .textContentType(.emailAddress)
            .font(.title)
    }
    .navigationTitle("Your code")
}
```
We’re going to use the name and email address fields to generate a QR code, which is a square collection of black and white pixels that can be scanned by phones and other devices. Core Image has a filter for this built in, and as you’ve learned how to use Core Image filters previously you’ll find this is very similar.

First, we need to bring in all the Core Image filters using a new import:
```
import CoreImage.CIFilterBuiltins
```
Second, we need two properties to store an active Core Image context and an instance of Core Image’s QR code generator filter. So, add these two to **MeView**:
```
let context = CIContext()
let filter = CIFilter.qrCodeGenerator()
```
Now for the interesting part: making the QR code itself. If you remember, working with Core Image filters requires us to provide some input data, then convert the output **CIImage** into a **CGImage**, then that **CGImage** into a **UIImage**. We’ll be following the same steps here, except:

1. Our input for the filter will be a string, but the input for the filter is **Data**, so we need to convert that.
2. If conversion fails for any reason we’ll send back the “xmark.circle” image from SF Symbols.
3. If that can’t be read – which is theoretically possible because SF Symbols is stringly typed – then we’ll send back an empty **UIImage**.

So, add this method to the **MeView** struct now:
```
func generateQRCode(from string: String) -> UIImage {
    filter.message = Data(string.utf8)

    if let outputImage = filter.outputImage {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }

    return UIImage(systemName: "xmark.circle") ?? UIImage()
}
```
Isolating all that functionality in a method works really well in SwiftUI, because it means the code we put in the **body** property stays as simple as possible. In fact, we can just use **Image(uiImage:)** directly with a call to **generateQRCode(from:)**, then scale it up to a sensible size onscreen – SwiftUI will make sure the method gets called every time **name** or **emailAddress** changes.

In terms of the string to pass in to **generateQRCode(from:)**, we’ll be using the name and email address entered by the user, separated by a line break. This is a nice and simple format, and it’s easy to reverse when it comes to scanning these codes later on.
```
Add this new **Image** view directly below the second text field:

Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
    .resizable()
    .scaledToFit()
    .frame(width: 200, height: 200)
```    
If you run the code you’ll see it works pretty well – you’ll see a default QR code, but you can also type into either of the two text fields to make the QR code change dynamically.

However, take a close look at the QR code – do you notice how it’s fuzzy? This is because Core Image is generating a tiny image, and SwiftUI is trying to smooth out the pixels as we scale it up.

Line art like QR codes and bar codes is a great candidate for disabling image interpolation. Try adding this modifier to the image to see what I mean:
```
.interpolation(.none)
```
Now the QR code will be rendered nice and sharp, because SwiftUI will just repeat pixels rather than try to blend them neatly. I would imagine cameras don’t care which gets used, but it looks better to users!
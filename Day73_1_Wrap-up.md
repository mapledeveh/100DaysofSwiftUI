# Bucket List: Wrap up

This was our biggest project yet, but we’ve covered a huge amount of ground: adding **Comparable** to custom types, finding the documents directory, integrating MapKit, using biometric authentication, secure **Data** writing, and much more. And of course you have another real app, and hopefully you’re able to complete the challenges below to take it further.

Although this exact project we made places maps at the center of its existence, they also extremely useful as little bonuses elsewhere – showing where a meeting takes place, or the location of a friend, etc, can add just that extra bit of useful detail to your other projects.

# Challenge

1. Our + button is rather hard to tap. Try moving all its modifiers to the image inside the button – what difference does it make, and can you think why?
2. Our app silently fails when errors occur during biometric authentication, so add code to show those errors in an alert.
3. Create another view model, this time for **EditView**. What you put in the view model is down to you, but I would recommend leaving **dismiss** and **onSave** in the view itself – the former uses the environment, which can only be read by the view, and the latter doesn’t really add anything when moved into the model.

**Tip:** That last challenge will require you to make a **StateObject** instance in your **EditView** initializer – remember to use an underscore with the property name!
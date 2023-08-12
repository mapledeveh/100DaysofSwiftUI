# Project 16, part 4

It’s time to start putting your new techniques into action, and this project is so big it takes three implementation days to complete. But this is day 82, so you’ve shown you have the willpower to make amazing things – as the aviation pioneer Amelia Earhart once said, “the most difficult thing is the decision to act, the rest is merely tenacity.”

There are lots of interesting techniques covered today, but I’ll also briefly be introducing you to the **filter()** method of sequences. We looked at **map()** previously, which is used to transform objects in a sequence from one thing into another, and filter works in a similar way: it’s a method on sequences, it accepts a closure that gets run on each element individually, and it returns a new array.

The difference is that the closure we pass **filter()** is used as a *predicate* – a test that is used to determine whether each element should be included in the returned array. If the test returns true for an element then it gets included, otherwise it will be skipped over.

Both **filter()** and **map()** belong to a category called *functional programming*. This is covered in great detail in my book [Pro Swift](https://www.hackingwithswift.com/store/pro-swift), but the abridged definition is that our code tells the computer *what* to do not *how* to do it. In the case of **map()** we’re saying “go over every item in this array, transform it using this closure, and put the results back into a new array”, but it’s down to Swift to figure out how to make that happen. For **filter()** we’re doing much the same: “go over every item in this array, run this test on each one, and put any that pass the test into a new array.”

Anyway, enough chat – you have lots to get through today, so let’s get on to the code!

**Today you have three topics to work through, in which you’ll learn about tab views, environment objects, **filter()**, and more.**

- Building our tab bar
- Sharing data across tabs using @EnvironmentObject
- Dynamically filtering a SwiftUI List
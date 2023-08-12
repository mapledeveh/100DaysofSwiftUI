# Core Data: Wrap up

Core Data might seem like a dry topic at first, but it’s so useful when building apps – you’ve seen how it can add, delete, sort, filter, and more, all with relatively simple code. Yes, a few parts are a little murky in Swift – **NSPredicate**, for example, could do with some refinement, and **NSSet** is never pleasant to deal with – but with a little work on our behalf this stops being a problem.

Perhaps the most important thing about Core Data is that it’s guaranteed to be there for all apps, on all of Apple’s platforms. This means you can use it regardless of your needs: maybe it’s for saving important data, maybe it’s just a cache of content you downloaded; it doesn’t matter, because Core Data will do a great job of managing it for you.

# Challenge

One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on.

All three of these tasks require you to modify the **FilteredList** view we made:

1. Make it accept a string parameter that controls which predicate is applied. You can use Swift’s string interpolation to place this in the predicate.
2. Modify the predicate string parameter to be an enum such as **.beginsWith**, then make that enum get resolved to a string inside the initializer.
3. Make **FilteredList** accept an array of **SortDescriptor** objects to get used in its fetch request.

**Tip:** If you’re using the generic version of **FilteredList**, your sort descriptors are of type **SortDescriptor<T>**. If you’re using the simpler, non-generic version, your sort descriptors are of type **SortDescriptor<Singer>**.
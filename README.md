# Description

- Load ListWidget and run the app.
- Increment first list item by clicking it 3 times. Scroll to bottom and then scroll to top, the count will get reset

# Functional/Product Requirement

- There should be 100 list items, each should be set at 0 initially and user can increment its count.
- The count incremented by user should be persisted when he scrolls the list.

# Task:

- Solve the functional requirement.
- Review this file from Code Review perspective, list the issues and what changes should be made, perform the changes to the file.
- Think of it as a intern checked in this code and as a senior has to code review and fix the code from implementation perspective to make it correct and efficient.
- Send the fixed file back to the recruiter.


# Solution:

## Widget State Persistence

In the `ListItemWidget`, we encountered an issue where the count was getting reset after scrolling back to the top from the bottom. To solve this problem, we explored two options.

### Option 1: Using `AutomaticKeepAliveClientMixin`

One approach to preserve the state of `ListItemWidget` is by using the `AutomaticKeepAliveClientMixin`. This mixin allows us to implement the `wantKeepAlive` getter, which determines whether the widget's state should be kept alive even when it's not visible on the screen. By setting `wantKeepAlive` to `true`, we can retain the state of the widget even when it's not in the current view. However, we observed that this method may not be ideal for our use case as the widget would be still alive after it is invisible.

### Option 2: Using `Provider` for State Management

To achieve more robust state persistence, we decided to use the `Provider` package for state management. By creating a `ListProvider` class that extends `ChangeNotifier`, we can easily maintain the state of each `ListItemWidget`. The `ListProvider` contains a `Map<int, int>` to store the count for each widget based on its `id`. With `Provider.of`, we can access the `ListProvider` instance in the `ListItemWidget` and update the count accordingly. This approach ensures that the count is retained even when scrolling back and forth in the list.

In this option, we leverage the power of the `Provider` package's `Selector` widget. The `Selector` widget allows us to efficiently rebuild specific parts of the UI that depend on specific parts of the `Provider` state. By specifying the `selector` parameter with a callback function that returns the value we want to listen to, we ensure that only the relevant text for a particular `ID` gets rebuilt when the count is incremented. This significantly improves the performance as it minimizes unnecessary rebuilds in other parts of the UI.

In conclusion, we chose to implement `Option 2` as it provided a more efficient and robust solution for preserving the state of `ListItemWidget`.
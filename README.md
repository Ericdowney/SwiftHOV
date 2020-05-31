# SwiftHOV

This package is meant to illustrate common functionality that can be abstracted into the idea of Higher Order Views. This is an established pattern in React called Higher Order Components.

## HOVs

The following is the list of implemented HOVs. The purpose of an HOV is to abstract some small piece of functionality or boilerplate code to allow the consuming SwiftUI view to more easily compose it's view hierarchy.

1. WithCalendar
2. WithColorScheme
3. WithContext
4. WithFetch
5. WithDataSource

### WithCalendar

The `WithCalendar` HOV injects the environment's `calendar` property.

### WithColorScheme

The `WithColorScheme` HOV injects the environment's `colorScheme` property.

### WithContext

The `WithContext` HOV injects the environment's `NSManagedObjectContext` property.

### WithFetch

The `WithFetch` HOV handles a Core Data `FetchRequest` with the specified properties. It then injects the environment's `NSManagedObjectContext` property as well.

### WithDataSource

The `WithDataSource` HOV handles the arbitrary fetching of data. This view handles data asynchronously and allows the consuming view to know when the DataSource is prepared, loading data, successfully finished loading data, and has failed to load data with an error. 

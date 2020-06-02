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

## License

MIT License

Copyright (c) 2020 Eric Downey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

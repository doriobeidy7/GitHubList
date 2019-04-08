# GitHubList


```
Github list show last 30 days of repos, implementation in swift using codable protocol, MVVM pattern, and scroll to load more from api.

Using MVVM pattern offers a way to organize code that doesn't result in massive view controllers
In MVVM, you abstract your code to include a viewModel, which is a file that holds the values to be presented in your view. 
The View Controller owns the viewModel which owns the Model and in turn, the Model updates the View Model, which is in turn, used to update the View Controller, which updates the view.

Codable Protocol. A type that can convert itself into and out of an external representation. It is used by the type can be both encoded as well as decoded. typealias Codable = Decodable & Encodable. It includes the methods declared in both Encodable as well as Decodable.
So we are using codable so we use JSONEncoder to convert codable type into Data. and also no redundant data.

the loadmore is using the data array and increment the page every time we finish loading last row. we re-add the new data items to the array so will be able reload it in the tableview

```


# Installation

```
Download the project https://github.com/doriobeidy7/GitHubList.git
select team as none so you can run directly on the simulator.
if you have iphone you will need apple id, and change the bundle identifier for the signing.

```

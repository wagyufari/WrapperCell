

# WrapperCell

WrapperCell is a custom table view cell that allows you to display SwiftUI views in a UITableViewCell. With WrapperCell, you can take advantage of the power and flexibility of SwiftUI to create dynamic and responsive user interfaces in your UITableView.

https://github.com/wagyufari/WrapperCell/blob/master/wrappercell/WrapperCell.swift

## Usage

To use WrapperCell, you need to register it as a cell class for your UITableView, and specify the SwiftUI view that you want to display as the cell's content. Here's an example:

``` swift
// Register the WrapperCell class for your table view
tableView.register(WrapperCell<DummyCell>.self, forCellReuseIdentifier: "cell")

// Create a SwiftUI view that you want to display in the cell
struct DummyCell: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding(32)
    }
}

// Implement the UITableViewDataSource method to dequeue and configure the cell
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    // Dequeue the WrapperCell and bind the DummyCell view as its content
    if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WrapperCell<DummyCell> {
        cell.bindContent(content: DummyCell())
        return cell
    }
    
    return UITableViewCell()
}

```

In this example, we're registering the WrapperCell class for our UITableView using the `register(_:forCellReuseIdentifier:)` method. We're also creating a simple SwiftUI view called DummyCell that displays a "Hello, world!" text using a VStack and some styling.

In the `tableView(_:cellForRowAt:)` method, we're dequeuing the WrapperCell using the `dequeueReusableCell(withIdentifier:for:)` method and binding the DummyCell view as its content using the `bindContent(_:)` method. Finally, we're returning the configured cell.

# parallax-table-view-header
Sample code illustrating how to implement a parallax scrolling table view header in Swift

### Demo
<img src="https://cloud.githubusercontent.com/assets/10542894/8099902/81b3b722-1004-11e5-98b2-81f335972db2.gif" />

### How to use
Create a new `ParallaxTableHeaderView` with a given size and subview as content:

```
var mapView = MKMapView(frame: CGRectMake(0,0, self.view.frame.width, tableHeaderViewHeight))
var tableHeaderView = ParallaxTableHeaderView(size: CGSizeMake(self.view.frame.width, tableHeaderViewHeight), subView: mapView)
tableView.tableHeaderView = tableHeaderView
tableView.delegate = self
```

<br>

Implement the `UIScrollViewDelegate` func, to layout the header view when the table view scrolls:

```
func scrollViewDidScroll(scrollView: UIScrollView) {
  let header: ParallaxTableHeaderView = self.tableView.tableHeaderView as! ParallaxTableHeaderView
  header.layoutForContentOffset(tableView.contentOffset)
  self.tableView.tableHeaderView = header
}
```

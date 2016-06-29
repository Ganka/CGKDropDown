# CGKDropDown

1. Add CGKDropDownOverlay into your project and import "CGKDropDownOverlay.h" into your controller.

1. Create an instance of CGKDropDownOverlay for the controller you need
  CGKDropDownOverlay *dropDownOverlay = [CGKDropDownOverlay dropDownOverlayWithDelegate:self];

2. Add CGKDropDownDelegate in your .h file

3. Implement the needed delegate methods
    "boundaryForDropDown" to set the boundary of the drop down list
        By setting the boundary, you can even set a drop down for a table view cell component or it's subview.
    "attachOverlay" to paste the overlay into your controller's view

4. By setting the delegate to self, It is your responsibility to take care of the drop down contents.
    So, drop down table's (dropDownOverlay.dropDownTable) datasource and delegates can be implemented in your controller.

5. Call the instance method "showDropDown" to display the drop down list

6. Once you get data through the table delegates like "tableView:didSelectRowAtIndexPath:", you can hide the view through the method call "hideDropDown"
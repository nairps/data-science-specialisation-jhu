
`globalTimeConverter` is simple Shiny-based web application that converts time from one zone to another.
The user interface (UI) of this `globalTimeConverter` is designed to have a `sidebar layout` with a `title panel`, `sidebar` and `main panel`. The user input widgets are consolidated in the `sidebar panel` on the left side.

## <font color="black">Organisation of the UI</font>
1. **`Title panel`**: Title
2. **`Navigation bar`**: Navigation tabs for the (i) main application (ii) About page and (iii) Documentation page
2. **`Sidebar panel`**: Space for user input widgets
3. **`Main panel`**:
  - Displays HTML summary of the time conversion 
  - ***Two tab panels***  
        - 1. **A Table**:  All hourly times (N=24) for the selected date converted to the times of the selected zone
        - 2. **A Summary**: A `verbal statement` of the time conversion result
   
## <font color="black">Sidebar Panel</font>
The `sidebar panel` on the left is designed with drop-down menus to choose the `time zone` from which to convert the time and the `time zone` to be converted. The naming convention used for the timezone in this application is `Area/Location` and a total of 505 locations are available for time conversions. The timezone to be converted from is initialized as _Europe/Zurich_ and the timezone to be converted is initialized as _America/Phoenix_. A date can be provided using the `date widget` that brings up a calendar to select dates and the time (hour, minutes and seconds) can be selected using the `time widget`.

## <font color="black">Main panel</font>
The `main panel` displays the HTML summary of the time conversion. In addition, there are two tab panels within the `main panel`. The first `tab panel` displays a table with all the hourly times from 00:00:00 to 23:00:00 for the chosen date converted to the time zone user wanted to. The table is designed to be filtered and sorted according to the user needs. The second `tabpanel` provides a verbal statement on the time conversion.
New values provided to the widgets will be reevaluated by the application and the updated conversions are displayed to the main panel and tab panels.


## <font color="black">Notes</font>

- All the input widgets on this `sidebar panel` have been initialized with a starting value

- Each session begins with the results for these initialized values displayed as the output on the `main panel` for demonstration purposes.

- User can select the timezones, date and time from the options presented in the sidebar on the left side and the time conversions will be automatically re-evaluated and updated

- This application is deployed on shinyapps.io server.

- The source code is freely available under MIT license from the [GitHub repository]((https://github.com/nairps/data-science-specialisation-jhu/developing-data-products/globalTimeConverter) 

- A summary of the application is available via `About` page on the `navigation bar`.

- Detailed documentation on the application, including its implementation, layout, availability and usage, is available on [GitHub pages](https://nairps.github.io/data-science-specialisation-jhu/developing-data-products/globalTimeConverter/).


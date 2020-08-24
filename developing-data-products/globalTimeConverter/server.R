
# Define the server logic
server <- function(input, output) {

    #----------------------------------------------------------------------
    #
    # Creating reactive conductors that gets updated with changes in input
    #
    #----------------------------------------------------------------------
    zone_in <- reactive({
        input$zone1
    })
    zone_out <- reactive({
        input$zone2
    })
    date <- reactive({
        input$date
    })
    time_at_zone1 <- reactive({
        str_c(date(), strftime(input$time_input, "%T")) %>%
            ymd_hms() %>%
            force_tz(zone_in())
    })

    time_at_zone2 <- reactive({
        with_tz(time_at_zone1(), zone_out()) %>%
            format(format = c("%Y-%m-%d %H:%M:%S (%Z)"))
    })

    time_at_zone2_v2 <- reactive({
        with_tz(time_at_zone1(), zone_out())
    })
    
    #-------------------------------------------------------
    # Create a formatted HTML summary to be
    # displayed in the main panel of the shiny app
    #-------------------------------------------------------
    output$results <- renderUI({
        HTML(
            paste(
                br(), br(),
                h4(
                    "Input Date and Time: ",
                    tags$li(
                        time_at_zone1(),
                        style = "font-weight:bold;
                        list-style-type=none;
                        color:#79240D;"
                    ),
                    br(), br(),
                    "Input Time Zone: ",
                    tags$li(zone_in(),
                        style = "font-weight:bold; 
                            color:#79240D;"
                    ),
                    br(), br(),
                    "Date and Time in ", zone_out(), ":",
                    br(), br(),
                    tags$li(
                        time_at_zone2(),
                        style =
                            "font-weight:bold; 
                             list-style-type=none;
                             color:#79240D;"
                    )
                )
            )
        )
    })
    
    #------------------------------------------------------------------
    #
    # Create datatable object for tab panel 1 with all the
    # hourly times converted for the selected day from and to the time zones
    # chosen by the user
    #
    #------------------------------------------------------------------
    output$table <- renderDataTable({
        times24 <- str_c(date(), "00:00:00") %>%
            ymd_hms() %>%
            force_tz(zone_in()) %>%
            add(hours(c(0:23)))
        df.times <- data.frame(
            format(times24, "%A, %Y-%m-%d, %H:%M:%S"),
            format(times24, "%A, %Y-%m-%d, %H:%M:%S", tz = zone_out())
        )
        colnames(df.times) <- c(zone_in(), zone_out())
        datatable(df.times,
                  filter = "top",
                  options = list(pageLength = 10)
        )
    })
    
    #-----------------------------------------------------
    # Create a summary text to be displayed on tab panel 2
    #-----------------------------------------------------
    output$summary <- renderText({
        str_c(
            "\n\nSUMMARY:\n\tWhen it is ",
            format(time_at_zone1(), "%A %Y-%m-%d, %H:%M:%S"),
            " in ", zone_in(), ",\n\t", zone_out(), " is ",
            format(time_at_zone2_v2(), "%A %Y-%m-%d, %H:%M:%S"),
            "\n\n",
            sep = ""
        )
    })
}

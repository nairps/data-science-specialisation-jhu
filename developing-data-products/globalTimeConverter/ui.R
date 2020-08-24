
#-------------------------------------------------
# Define UI for the shiny application
#-------------------------------------------------
ui <- navbarPage(
    theme = shinytheme("flatly"),
    fluid = TRUE,

    # title for the shiny application
    titlePanel(
        title =h1(
            tags$div(
                style =
                    "background-color: #a3c2c2;
                     width: 100%; 
		             height: 50px; 
                     border-radius: 5px;
                     text-align:center;",
                ("globalTimeConverter")
            )
        ),
        windowTitle = "globalTimeConverter"
    ),
    
    #-------------------------------------------------------------------
    # Design the first tabpanel for the navigation bar of the webapp
    #-------------------------------------------------------------------
    tabPanel(
        title = "globalTimeConverter",
        
        #--------------------------------------------------
        # Define a layout with a sidebar for the webapp
        #--------------------------------------------------
        sidebarLayout(

            #--------------------------------------------------
            # Define the sidebar panels for providing input
            #--------------------------------------------------
            sidebarPanel(
                width = 4, height = 20,

                includeMarkdown("sidebar.md"),
                
                #-------------------------------------------------
                # select a time zone to convert from
                #-------------------------------------------------
                selectInput(
                    "zone1", "Choose the Time Zone to convert from:",
                    selected = "Europe/Zurich",
                    time_zones
                ),

                #-------------------------------------------------
                # select a date
                #-------------------------------------------------
                wellPanel(
                    style = "border:1px;
                        border-color:#a3c2c2;
                        padding-top:2px; 
                        padding-bottom:2px; 
                       background-color:white",
                    dateInput("date",
                        label = "Select a date",
                        value = "2020-08-17" # Sys.Date()
                    )
                ),
                
                #-------------------------------------------------
                # select a time to convert
                #-------------------------------------------------
                tags$div(
                    style = "border:1px;
                        padding-left:25px; 
                        padding-top:2px; 
                        padding-bottom:2px; 
                        font-size=large;
                        border-color:#a3c2c2;
                        background-color:white",
                    timeInput(
                        "time_input", "Select a time to convert",
                        value = strptime("10:00:00", "%T")
                    )
                ),
                
                #-------------------------------------------------
                # select the time zone to convert to
                #-------------------------------------------------
                selectInput(
                    "zone2", "Choose the Time Zone to convert to:",
                    selected = "America/Phoenix",
                    time_zones
                ),
                includeMarkdown("notes.md")
            ),
            
            #---------------------------------------------------------------
            # Define the main panel for displaying reactive output elements
            #---------------------------------------------------------------
            mainPanel(
                includeMarkdown("main.md"),
                #---------------------------------------------------------------
                # the formatted results
                #---------------------------------------------------------------
                uiOutput("results"),
                br(),
                br(),
                #---------------------------------------------------------------
                # render the hourly converted times & summary to the tab panels
                #---------------------------------------------------------------
                tabsetPanel(
                    tabPanel(
                        "Hourly time convertions for the day",
                        dataTableOutput("table")
                    ),
                    tabPanel(
                        "Summary statement for time conversion",
                        verbatimTextOutput("summary")
                    )
                )
            )
        )
    ),
    
    #-------------------------------------------------------------------
    # Design the 2nd & 3rd tabpanels on the navigation bar of the webapp
    #-------------------------------------------------------------------
    tabPanel("About", includeMarkdown("about.md")),
    tabPanel("Documentation", includeMarkdown("index.md"))
)

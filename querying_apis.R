library(tidycensus)
census_api_key("bdb1f6ff2e4982a1da64cd526532aa92dca5581c", install = TRUE, overwrite = TRUE)

rent <- "DP04_0142PE"
rent_data <- get_acs(variables = rent,
        geography = "county",
        geometry = TRUE,
        survey = "acs5",
        show_call = TRUE)

#from slide 9
#probably important for Project 1
load_data_acs <- function(geography, formatted_variables, key, year, state = NULL,
                          county = NULL, zcta = NULL, survey, show_call = FALSE) {
    base <- paste("https://api.census.gov/data",
                  as.character(year), "acs",
                  survey, sep = "/")
    
    if (grepl("ADP", formatted_variables)) {
        message("Using the ACS Data Profile")
        base <- paste0(base, "/profile")
    }
}


#hockey example
#httr:GET() to put built URL into
#use jsonlite over rjson, tidyjson, and RSONIO 

#build a URL:
URL_ids <- "https://api.nhle.com/stats/rest/en/team"
id_info <- httr::GET(URL_ids)
str(id_info, max.level = 1)

#rawToChar with jsonlite::fromJSON()
library(jsonlite)
parsed <- fromJSON(rawToChar(id_info$content))
team_info <- as_tibble(parsed$data

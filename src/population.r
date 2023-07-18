# population.r
# parse and prepares population estimates by region from Stats NZ

get_population = function(){
    path = "data/snpe-at30june21-population-table.csv"
    data = read.csv(path)

    # drop everything past column 5
    data = data[,1:5]
    names(data) = c("Region", paste0("Year", 2018:2021))

    data$Region = tools::toTitleCase(data$Region)

    return(data)
    }

get_population_year = function(year = 2021){
    year = match.arg(as.character(year), 2018:2021)
    population = get_population()
    data = population[[paste0("Year", year)]]
    names(data) = population$Region

    return(data)
    }

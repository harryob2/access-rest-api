#Source: https://towardsdatascience.com/accessing-data-from-github-api-using-r-3633fb62cb08

#install.packages("jsonlite")
library(jsonlite)
#install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)

# Choose application
oauth_endpoints("github")
myapp <- oauth_app(appname = "Harry_O_Brien_CSU33012",
                   key = "de353dc00fea8d0abbca",
                   secret = "c0772a26af1c1ce40943339de098c740ec1bd047")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/harryob2/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "harryob2/Biography-Assignment", "created_at"] 

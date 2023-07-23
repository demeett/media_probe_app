# Most Popular News App

This app is a mobile application that lists news articles using the NY Times Most Popular API and navigates to a detail page when each news item is clicked. The app is developed using Flutter and utilizes the Dio package for fetching news articles, while using the GetIt package for managing dependencies.

## Features

-Fetching news articles using the NY Times Most Popular API
-Navigating to detail page when a list item is clicked
-A widget test to verify the news article title in the detail page
-Sorting articles based on their publish dates using the sort function.

  
## Used Packages and Architectures

- Dio: Used for making HTTP requests. Utilized to connect to the NY Times Most Popular API. Error checks were made.
- GetIt: Used for dependency injection. Helps manage dependencies for services.
- Json Serializable:It was used to create the model.
- Cubit: Used for state management in the app. Cubits are employed to manage the news list and the content in the detail page.
- Cubit Architecture: An implementation of MVVM architecture using Cubit.
- Script.sh: The script.sh file was used to create the model.
  
## Tests

There are two types of tests in the app:

1. Unit Tests: Written to test the HTTP requests made using the Dio package to the Most Popular API.

2. Widget Tests: A widget test to verify the title in the app bar on the detail page.

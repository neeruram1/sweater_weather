# Sweater Weather

Sweater Weather is the backend of an application that correlates forecasts to specific locations, and also allows a user to plan road trips. The user is able to see the current forecast at any location as well as the arrival destination. 

## Getting Started
- Fork (and/or) clone this repository
- In your terminal run the following commands:
  - `rails db:create`
  - `rails db:migrate`
  - `bundle exec figaro install`
    - This command will create an application.yml file - make sure this file is gitignored and populate with your own ENV variables for each API

## API Consumption
**The following APIs were used in this project:**
- OpenWeather
- MapQuest
- Unsplash

## Endpoints 

**Forecast**
- api/v1/forecast?location=**city, state**
- Shows the current, hourly, and daily forecast for a location

**Background Image**
- api/v1/background?location=**city, state**
- Finds an image that is related to the searched location

**User Registration**
- api/v1/users
- Registers a new user and generates a unique API key for the user

**User Login**
- api/v1/sessions
- Authenticates a user and logs them into the application

**Road Trip**
- api/v1/road_trip
- Returns estimated travel time and arrival forecast for a road trip
- An origin location and destination location are sent as well as the api key for authentication
- A Road Trip belongs to a User

## About
- This project uses **Ruby 2.5.3** and **Rails 5.2.4**
- Created by Neeru Ram for the Backend program at the Turing School of Software & Design

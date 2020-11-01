# Sweater Weather

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

## Table of Contents

- [Overview](#overview)
- [Technology Used](#technology-used)
- [Installation](#installation)
- [API Consumption](#api-consumption)
- [API Endpoints](#api-endpoints)
- [Contact Information](#contact-information)

<!-- Brief Description -->

## Overview

Sweater Weather is the backend of an application that correlates forecasts to specific locations, and also allows a user to plan road trips. The user is able to see the current forecast at any location as well as the arrival destination. 

- [Original Project Link](https://mod4.turing.io/projects/capstone.html)


### Wins

This project consumes two APIs and manipulates that data and reformats it for use in a custom built API. Consuming and building APIs in one application was a fun challenge. 

### Struggles

Deciding on the optimal architecture and structure of the API. Figuring out the best way to use facades and modules within this backend. 


## Technology Used

- Ruby 2.5.3
- Rails 6.0.3
- PostgreSQL database
- RSpec for testing

## Installation

- [Technical Requirements](https://backend.turing.io/module3/projects/sweater_weather/requirements)

**Fork this repository:**

https://github.com/neeruram1/sweather_weather/

**Clone your forked repository**

`git clone` and the copied URL

**Getting Started**
- In your terminal run the following commands:
  - `rails db:create`
  - `rails db:migrate`
  - `bundle exec figaro install`
    - This command will create an application.yml file - make sure this file is gitignored and populate with your own ENV variables for each API

## API Consumption
**The following APIs were used in this project:**
- [OpenWeather API](https://openweathermap.org/api/one-call-api)
- [MapQuest API](https://developer.mapquest.com/documentation/geocoding-api/)
- [Unsplash API](https://unsplash.com/developers)

## API Endpoints 

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

### Contact Information
👤 **Neeru Ram**

- Github: [neeruram1](https://github.com/neeruram1)
- LinkedIn: [Neeru She/Her](https://www.linkedin.com/in/neeru-ram-81a2b867/)






<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/neeruram1/sweater_weather.svg?style=flat-square
[contributors-url]: https://github.com/neeruram1/sweater_weather/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/neeruram1/sweater_weather.svg?style=flat-square
[forks-url]: https://github.com/neeruram1/sweater_weather/network/members
[stars-shield]: https://img.shields.io/github/stars/neeruram1/sweater_weather.svg?style=flat-square
[stars-url]: https://github.com/neeruram1/sweater_weather/stargazers
[issues-shield]: https://img.shields.io/github/issues/neeruram1/sweater_weather.svg?style=flat-square
[issues-url]: https://github.com/neeruram1/sweater_weather/issues






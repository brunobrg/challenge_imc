# IMC Challenge

This is a basic api for return IMC uppon given height and weight


## Build

To build this app, simple run
```
docker-compose up --build
```
the project will be build on http://localhost:3000

## Get IMC

To calculate IMC, make a http.post to '/imc' route with following json:

```
{
  "height": <your height>
  "weight": <your weight>
}
```

## Authentication

This project uses JsonWebToken to validate your request. As this project is not meant for production, but for a challenge, the token can be found in application_controller.rb

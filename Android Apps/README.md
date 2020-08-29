# Hydrophone

Hydrophone is the Android (and possible implementation for IoS too) application for the IoT integrated Hydroponic system 
created using the Flutter UI Toolkit provided by google on Android Studio using [this](https://github.com/londonappbrewery/bmi-calculator-flutter) 
as design base.

## Getting Started

<img src="tutorial%20images/opening_screen.png" width="200">


This is the Opening Screen of the app. you just need to tap the button to proceed to the next screen.

<img src="tutorial%20images/data_screen.png" width="200">


This is the Data screen of the app, it shows the last recorded temperature, tds, flow rate, and the date. You can tap the 
Update button to update the data displayed on screen, if there are new data on the database the screen will update itself,
otherwise it will still show the last data. You can also swipe the screen from right to left to get to the Input Screen.

<img src="tutorial%20images/input_screen.png" width="200">


you can drag the slider into the flow rate you wanted and also choose to turn the lights on/off using the button,
after choosing the setting you wanted you can tap the submit button.


<img src="tutorial%20images/link.PNG">


If you want to change the http.get and http.post server, you can change this part part of the [this](lib/functionality/constant.dart)


<img src="tutorial%20images/body_and_headers.PNG">


after changing the server also make sure that the body and headers in [this](lib/functionality/networking.dart) are the same as the 
body and headers from the services you used.


<img src="tutorial%20images/jsondata.PNG">


you should also check and change [this](lib/screens/dataPage_screen.dart) to mirror where exactly the data is stored.


<img src="tutorial%20images/jsondata_example.PNG">


for example i'll be using a [json formatted data](https://samples.openweathermap.org/data/2.5/weather?id=2172797&appid=439d4b804bc8187953eb36d2a8c26a02) 
from OpenWeather Map Website. here the Update data function should be formatted like this


<img src="tutorial%20images/getting_example.PNG">
# Exercise

This app uses foursquare API to get surrond cafes. Mock location is utilized when running this app in a simulator.
Therefore it is suggested that run this app in a real device to check the full functionality, expecially continuesly updating the list while the device location changed.

Insteaded of simply finishing the task, I mainly use my time to play with architecture.
This app still follows a simple MVC pattern in a hign level
But I added additional layers , like business logic layer and network layer to divide the responsibilities of controllers.
So the controllers will not become cumbersome  in the future.

Furthermore, a simple EDA engine I made before help me to decouple updating location logic from UI. Everytime when the device's location changed, the location handler will send out a notification to notify the tableview controller to do corresponding re-fectch action.

For enterprise projects, it is recommanded to apply advanced MVVC pattern or VIPER pattern to manage responsibity division better.


In this app, some aspects I have noticed can be improved in the future:

1. Insufficient unit test cases: Although I have applied unit test for critical cases. However, all these cases are all positive test cases, which means the error handlings in this app are net yet been tested in Unit Testing. 

2. No data persistence layer: It cannot save fetched data to anywhere at this moment.

3. User expereince: UI design and User expereince definitely can be improved. 

4. The current layout looks good in the vertical mode. But in the horizontal mode, it wastes too much spaces


Key functionalities in this app:

1.Updating location continuously

2.Fetching data asynchronously

3.Items are ordered in asceeding order

4.Able to make a call when press on the phone number in the list

5.Able to lauch an external map app when press on the map marker button in the list.

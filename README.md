## Task Description:
- Develop a modular mobile application in Swift and UIKit following the * *VIPER* * architecture.
- The application should consist of two modules:


** **Module A:** ** This would contain only one screen (Listing Screen)

** **Module B:** ** This would contain only one screen (Details Screen)

## Logic & Business Flows:
- The user should land on the Listing screen, the screen should always fetch the data from the API and then cache the data in the local DB. In case of API failure, the screen should fetch the data from the DB if it exists, otherwise, an error should be displayed.
- Use the following API: http://universities.hipolabs.com/search?country=United%20Arab%20Emirates
- DB used is * *Realm* *.
- If the user taps on one of the items in the list, he should be redirected to a details screen, with the capability to refresh the listing screen. No second API call is required, the data should be passed from the first screen
- The refresh button functionality is to trigger a refresh on the listing screen. The details screen should be dismissed, landing the user on the first screen. The listing screen should be reloaded and the API should be fired again 


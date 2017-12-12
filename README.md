# Truman 
  
![Truman Experience](./images/demo.png) 
  
Truman is the intersection of AI, Fleet Maintenance and the nicest technologies (Voice and AR). 
Truman covers 2 scenarios: road and maintenance shop. 
<br><br> 
On the road, a driver can make complaints about the vehicle and receive recommendations from 
Truman about his/her complaints. In addition, drivers receive alerts about a component that 
is going to fail (Failure Prediction) with suggestions about what to do next. A driver uses 
voice and a mobile app to interact with Truman. 
<br><br> 
On the maintenance shop, Truman can collaborate with a mechanic and suggest repair recommendations. 
Truman points out which components and parts need to be fixed as well as it could 
determine what order the service needs to be executed (overall 
maintenance optimization). A mechanic uses a 
web interface to interact with Truman. 
<br><br> 
Truman tightly integrates road and maintenance shop providing a seamless experience, an end-to-end 
maintenance experience. The Truman experience. 
<br><br> 
Truman is a work in progress. 
  
<br> 
## Overview 
  
<br> 
Truman is composed of several components, such as: Alexa Voice Skill, Truman services, Web interface and Mobile Application. 
See architecture below. 
<br><br> 
  
![Truman Architecture](./images/architecture.png) 
  
<br><br> 
This repository relates to the Truman iOS mobile application. 
Truman mobile application allows driver to 
Receive the events and complaints notifications,   
View the recommendations details for events and complaints 
View the nearest shops as per the recommendation 
Book an appointment from the available slots 
View the appointment details 
Select the parking slot. 
Complete the check-in process 
View the quick fix steps 
 
 
<br><br> 
Truman mobile application uses 
iOS SDK(XCode 9.2) 
Swift Language 4.0 
Alamofire(https://github.com/Alamofire/Alamofire), for network interaction 
Cocoapods(https://cocoapods.org/), for dependency management of libraries 
FSCalendar(https://github.com/WenchaoD/FSCalendar), for displaying appointments  
SwiftyJSON(https://github.com/SwiftyJSON/SwiftyJSON), for handling json reponse 
SDWebImage(https://github.com/rs/SDWebImage), for asynchronously downloading images. 
 
<br> 
## Repository Contents 
  
<br> 
* `/Truman` - main project  
* `/TrumanTests` - Functional test cases 
* `/TrumanUITests` -  Usability test cases 
* `/Truman/Models` - Application model classes 
* `/Truman/ViewContollers` - Applications controllers 
* `/Truman.Assets` - Images 
 
<br><br> 
  
<br> 
## Installation on the Real Device. 
  
<br> 
Create certificates using Keychain Access and upload to Apple Developer Site 
Download the provisioning profiles and add to the project. 
Select appropriate provisioning profiles in XCode from build settings. 
Select the device in the build device options and run the application. 
 
For more details: 
https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/CreatingYourTeamProvisioningProfile/CreatingYourTeamProvisioningProfile.html 
  
   ``` 
<br> 
  2\. Clone the repository 
  
  ``` 
  $ git clone git@4.16.42.23:mahesh/truman-mobile-app.git 
  
  or 
  
  $ git clone git@137.168.216.245:mahesh/truman-mobile-app.git 
  ``` 
  The last one is if you are in the HAL network. 
  
<br> 
  3\. Install pod file and dependencies  
  ``` 
  $ cd Truman 
  $ pod install 
  ``` 
<br> 
 
## Tutorial and Guide 
  
[Provisoning Profiles]https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/CreatingYourTeamProvisioningProfile/CreatingYourTeamProvisioningProfile.html 
 [Cocoapods]https://cocoapods.org/ 
[] 
 
 
## Documentation 
  
Apple documentation and Videos  
  
 

There are two steps involved in the process of Setting up WSO2Con App
	
	1. Configuring Application API - Jaggery App

	2. Configuring and running the mobile application
	

1. Configuring Application API - Jaggery App

	Step 1 : Set up a Jaggery Server. [1]
	
	Step 2 : Put WSO2Con Jaggery app (app_api) inside JAGGERY_HOME->apps.
	
	Step 3 : Set up MySQL database. (DB Scripts can be found inside app_api->dbscripts).
	
	Step 4 : Open db.jag and update database parameters.
	
	Step 5 : To configure API Docs, Open apidoc->index.html and change discoveryUrl and Open apidoc->docs->mobileapi.json and change basePath to your configurations.
	
	Step 6 : Run Jaggery Server.

2. Configuring and running the mobile application

	Step 1 : Android and iOS applications can be found on WSO2Con GIT repository. You need to download mobile application and open in your preferred IDE.
	
	Step 2 : Open www->index.html and change wso2conAPI and tokenIssuer URLs to your configurations (Android - assets->www, iOS - Project Directory -> www).
	
	Step 3 : Compile and Run the application.


[1] - http://jaggeryjs.org/

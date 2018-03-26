# Networking (in the context of iOS)

* should be handled async on an iPhone.
* how long will a network request take? any amount of time including forever.
* you may or may not get what you expected.
* get data from "The cloud"
* send data (push data) to "The Cloud"
* We will sometimes network with our own servers, sometimes use a baas, sometimes use people's API's like yelp or flickr. 
* API: Application programming interface, web apis: uri's and http methods. 

## HTTP & Curl

* most used way of communicating on the internet.
* HyperText Transfer Protocol 
  - iOS considers HTTP un secure, you have to tell the user you're doing something "bad"
  - Put that message in the plist
* HyperText Transfer Protocol Secure
  - iOS considers HTTPS "secure"
* Methods
  - GET, PUT, DELETE, POST

* HyperText
  - HTML HyperText Markup Language. 
* Transfer
  - being able to move data between computers over a network.
* Protocol
  - Agreement on how to communicate

* Client server model
  - Server: the thing in the cloud
  - Client: whatever access the thing in the cloud
    any browser, iPhone, android, potentially that has internet, bots

* iOS devs are building the clients.

TCP/IP
* HTTP, HTTPS, FTP, SMTP, SNMP, xP

* What can you transfer with HTTP? 
  - Data, image files.
  - JSON
  - Anything

* We use JSON to transfer data between client and server
JavaScript Object Notation

* HTTP status code
  - 404
  - A code that represents the status of the request.
  - 200 - ok
  - 300 - redirect
  - 400 - we fucked up
  - 500 - they fucked up


### Tools

* make GET requests from a browser
* POSTman to make any HTTP request
* `ping` in terminal just to make an HTTP request that doesn't get much data, just time data.

### HTTP is stateless

* The client will never keep track of the state of the server. 
* The server will never keep track of the state of teh client. 

## REST RESTful

When we're talking about HTTP APIs

* Provides a "predictable" way of communicating through an API.
* guidelines or an idea, more than a protocol.

This is what we're talking about when we say REST

* REpresentational State Transfer
* An api is RESTful when the server or sevice makes it RESTful.
* A way of communicating through HTTP.

* GET should **just** get data, it should **never** create or change data.
* POST create a new resource
* PUT to update an existing resource
* DELETE to delete a resource.

url follow a common pattern:

something.com/collection/key/subcollection/

rockets.com/users?firstletter=s

GET: collection of users
POST: create a new user

rockets.com/users/sam

GET: the user sam
PUT: update the user sam
DELETE: delete the user sam

curl --request "PUT" --header "token: alkjshgi" --data {birthdate: 03/04} rockets.com/users/sam

rockets.com/users/sam/rockets

---

## User Notifications

* give you alerts on your phone

* push notification
  - Server (HTTP)
  - Remote notifications
* local notification (based events)
  - Location changed
  - Trigger a notification at a certain time
  - Trigger in a certain amount of time 
* silent notification
  - notification that does not appear to the user. The user never sees it. 
  - Internally in our code we want to handle something, without notifying the user. 

* Dont bombard a user with notifications. 

* UNUserNotificationCenter

* Local vs Remote vs Silent Notifications

https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/index.html#//apple_ref/doc/uid/TP40008194-CH3-SW1


--- 

## Snippets

```terminal
curl \
--header "Authorization: Bearer MpkOVAHFzB7ZUYbR_SIYGU49ptu36zMBeJ2L0GIrlb33POEGZp1HSubftfiD1m_hBCnks6TjTUuiMHp6JtrmNDvKzXeUvExPXqgtJqwVe4nTF_gcDfejKEeSo2NJWnYx" \
--request "GET" \
--url "https://api.yelp.com/v3/businesses/search?term=cafe&latitude=49.281815&longitude=-123.108414" \
| jsonpp
```

```swift
let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
      
}

let content = UNMutableNotificationContent()
content.title = ""
content.body = ""
content.sound = UNNotificationSound.default()

let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
      
// Create the request object.
let request = UNNotificationRequest(identifier: "Alart", content: content, trigger: trigger)
center.add(request, withCompletionHandler: { error in
  if let error = error {
    print("ERror with notification")
  } else {
    print("🤗")
  }
})
```
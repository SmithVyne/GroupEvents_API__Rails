# GROUP EVENTS API

# My Instructions:


# How to setup:
* Setup Ruby and Ruby-on-Rails on your computer
* Run `bundle install` to install the necessary ruby gems
* Run `rails server` to start-up the application and visit `localhost:3000/group_events`.
* I used Postman for tests

# How to get started:
- Event Columns
- Base Url
- Endpoints
- Request and Response Formats
- Testing

# Event Columns
*  name 
*  description
*  startDate  -  First day of the event. *
*  endDate    -  Last day of the event. *
*  duration
*  deleted    -  true or false
*  published  -  true or false
*  location   -  Where will the event happen (e.g. Toronto)

## BASE URL
    `localhost:3000/group_events` - This is where most of the magic happens

# How to create a new group event(POST):
  Required Fields:
*  name 
*  description
*  startDate  -  First day of the event. *
*  endDate    -  Last day of the event. *
*  duration
*  published  -  true or false
*  location   -  Where will the event happen (e.g. Toronto)

* *ATTENTION: For startDate and endDate, send a POST request with the date formatted as 'YYYY MM dd'
NOTE: Pay attention to the cases
NOTE: You can choose to omit one from startDate, endDate, or duration, and the app will figure it out.

# How to request all the events(GET)
Send a GET request to `localhost:3000/group_events` to access all created events

# How to Update and events (PATCH/PUT):
Send a PATCH/PUT request to `localhost:3000/group_events/:id` 
with the event's id to update an event

# How to "Delete" an event (DELETE):
Send a DELETE request to `localhost:3000/group_events/:id` 
with the event's id to "delete" an event

- This is a pseudo delete beacause a DELETE request doesn't actually remove the event from the db, but it updates the *deleted* column of the event to true.


## Author
👤 **Smith Vyne**
- Github: [@SmithVyne](https://github.com/SmithVyne)
- Twitter: [@SmithVyne](https://twitter.com/SmithVyne)
- Email: [email me](mailto:smithnkereuwem2@gmail.com)

## Use and Share your feedback

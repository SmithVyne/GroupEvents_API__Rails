# GROUP EVENTS API

# My Instructions:
![project-instructions](/docs/proj-instruc.png)

# How to setup:
* Setup Ruby and Ruby-on-Rails on your computer
* Run `bundle install` to install the necessary ruby gems
* Run `rails server` to start-up the application and visit `localhost:3000/group_events`.
* Postman, RSpec, and FactoryBot for tests

# Event Columns
*  name 
*  description
*  startDate 
*  endDate
*  duration
*  deleted    -  true or false
*  published
*  location 

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

* *ATTENTION: For startDate and endDate, send a POST request with the date formatted as 'YYYY MM dd'.
* *Pay attention to the cases.
* *NOTE: You can choose to omit one from startDate, endDate, or duration, and the app will figure it out.

# How to request group events(GET)
Send a GET request to `localhost:3000/group_events` to access all created events
![get all group events](/docs/sample_get1.png)
<br>
Send a GET request to `localhost:3000/group_events/:id` with an event id to get a single event 
![get all group events](/docs/sample_get.png)

# How to Update an event (PATCH/PUT):
Send a PATCH/PUT request to `localhost:3000/group_events/:id` 
with the event's id to update an event

# How to "Delete" an event (DELETE):
Send a DELETE request to `localhost:3000/group_events/:id` 
with the event's id to "delete" an event

- This is a pseudo-delete beacause a DELETE request does not remove the event from the db, but it updates the *deleted* column of the event to true.

# Other Endpoints
Visit:
- `localhost:3000/drafts` to get all unpublished events
- `localhost:3000/publishes` to get all pusblished events
- `localhost:3000/deletes` to get all "deleted" events


# TESTING THE API
I built my tests with RSpec and FactoryBot, run `rspec` in the terminal and check the `spec` directory


## Author
👤 **Smith Vyne**
- Github: [@SmithVyne](https://github.com/SmithVyne)
- Twitter: [@SmithVyne](https://twitter.com/SmithVyne)
- Email: [email me](mailto:smithnkereuwem2@gmail.com)

## Use and Share your feedback

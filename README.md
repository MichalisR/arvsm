# AVRSM
An ordinary way for any employee to request an approval to leave for some hours/days off the
office is to send an email to the HR department and his Reporting manager. Then both parties
approve or deny the request, resulting in an overload of communications over emails, messengers
etc.

## Specifications

- Ruby on Rails v4.2.3
- PostgreSQL
- Bootstrap

## Features

### Employee Features

- Request statuses: Requested/Approved/Denied
- A request includes a description, a starting date, an amount of working days and a
reference to a user that will be the reporting manager. It also includes a comment
that is be initially empty but required when a manager approves or denies a Request.
- All users are able to be authenticated to login in the application
- The employee is able to create a new Request and submit it for approval
- The employee is able to view all his Requests and their status on a list or table
- The employee is able to assign a Request to another User, as the approver
- The employee should be able to receive an email when a Request is approved or denied by
the manager
- The employee is able to choose an Absence type: Full/Partial/Sickness

### Manager Features

- The manager is able to view all Requests assigned to self in a table
- The manager is able to approve or deny the Request with a comment
- The manager is able to receive an email when a new Request is created


## Installation

In order to run the application: 

- ```sh bundle install ``` Install required gems
- ```sh rake db:setup ``` Setup and seed the database
- ```sh rails server ``` Run embedded rails server

## Credentials

### Employee

- email: johndoe@mycompany.com password: myPassword

### Managers

- email: janedoe@mycompany.com password: myPassword
- email: foobar@mycompany.com password: myPassword


# raitter


## Overview

Something like SNS that combines some of the features of ◯ witter and ◯ lack created in Rails API mode

## Requirement
- ruby-> 2.6.0
- Rails-> 5.2
- mysql

## Usage
```
$ git clone https://github.com/nyankichikun/raitter.git
$ bundle install
$ export MYSQL_USER
$ export MYSQL_PASSWORD
$ export MYSQL_HOST
$ rails s
```

## Feature
- user management and authentication-> device_auth_token

## Endpoint
<font color="Red"> **Do not write the endpoint by device and device_auth_token** </font>

- api/{version}/users
	- GET
		- overview
			- list  of all users
		- query
			- not required
	- /{:id}/following
		- GET
			- overview
				- list of following user
			- query
				- not required
	- /{:id}/followers
		- GET
			- overview
				- list of followers user
			- query
				- not required

- api/{version}/tweets
	- GET
		- overview
			- timeline
		- query
			- not required
	- POST
		- overview
			- post tweet
		- query
			- not required
	- /{:id}
		- GET
			- overview
				-  detail tweet
			- query
				- not required

- api/{version}/favorites
	- POST
		- overview
			- like tweet
		- query
			- tweet_id: integer
	- /{:id}
		- DELETE
			- overview
				-  remove tweet like
			- query
				- not required

- api/{version}/follow_relationships
	- POST ->
		- overview
			- followed user
		- query
			- user_id: integer
	- /{:id}
		- DELETE ->
			- overview
				- remove followed user
			- query
				- user_id: integer

- api/{version}/entries
	- GET
		- overview
			- list of participating rooms
		- query
			- not required
	- POST
		- overview
			- enter the room
		- query
			- room_id: integer
	- /{:id}
		- DELETE
			- overview
				- leave the room
			- query
				- not required

- api/{version}/rooms
	- GET
		- overview
			- list rooms
		- query
			- not required
	- POST
		- overview
			- create room
		- query
			- user_id: integer -> dirrect message room
			- public: true -> private room,  can not user with user_id
	- /{:id}
		- DELETE
			- overview
				- delete room
			- query
				- not required

- api/{version}/messages
	- GET
		- overview
			- get messages
		- query
			- not required
	- POST
		- overview
			- message  to room
		- query
			- room_id: integer

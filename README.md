# Intervals API
By [Staplegun](http://staplegun.us)

## Description

This gem is a wrapper around the [Intervals](http://www.myintervals.com/) REST API which allows you to retrieve,
create, update, and delete several different resources from their database.

## Usage

To begin, create an instance of your specific Intervals account using the
account's API token. You can [learn where to find that
here](http://www.myintervals.com/api/authentication.php).

```ruby
intervals = IntervalsAPI::RequestHandler.new('your_token')
```

Now you're free to make your requests. The structure of a request looks like:

```ruby
intervals.get(resource, query_options)
```

### Request Arguments

#### resource
Type: `String`

The endpoint resource you are querying

#### query_options
Type: `Hash`
Default: `{}`

A hash of options that you wish to query by. This could be filter options for a
GET request, new object options for a POST request, etc.

[View the Intervals documentation](http://www.myintervals.com/api/) to learn
about which resources and query options are available to use

### Response

The response from Intervals API will contain all returned json data from Intervals in the form of a hash.

### Request Type Examples

#### Get

```ruby
# Retrieve all clients
response = intervals.get('/client/');
```

```ruby
# Retrieve all active clients
response = intervals.get('/client/', { active: true });
```

#### Post

```ruby
# Create a task request
intervals.post('/request/', {
  personid:     5,
  projectid:    6,
  title:        'Just an average title'
})
```

#### Put

```ruby
# Update a task request
intervals.put('/request/1/', {
  priorityid:   1,
  title:        "Here's an updated title"
})
```

#### Delete

```ruby
# Delete a task request
intervals.delete('/request/1/')
```

## TODO

Build a test suite to test the API. If anyone has a great way to test an
authenticated third-party API, throw out some ideas.

<hr />
Intervals API is licensed under the [GPL](http://www.gnu.org/licenses/gpl.html)
license.

[Staplegun](http://staplegun.us)

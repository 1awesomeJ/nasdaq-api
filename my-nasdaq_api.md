# My Nasdaq API #

This API allows you to get stock information about companies quoted on NASDAQ whose valuation are $2bn or higher.

The API is available at 'http://35.155.212.2:3000/'

## Endpoints ##

### companies#index ###

GET `/`

Returns a JSON of all 1920+ companies in the API model.
The result is paginated with only 15 companies displayed per page.


Optional query parameter:

- page: number from 1 to 129.

GET '/' displays only the first page by deafualt.
To display any of the 129 pages, for instance to display page 44, use:

GET '/companies?page=44'

i.e 'http://35.155.212.2:3000?page=44'

The total number of pages may change from the currrent 129 as companies get added to, or removed from the model.

### List of companies ###

GET `/companies`

Returns a JSON of all 1920+ companies in the API model.
The result is paginated with only 15 companies displayed per page.


Optional query parameter:

- page: number from 1 to 129.

GET '/companies' displays only the first page by deafualt.
To display any of the 129 pages, for instance to display page 63, use:

GET '/companies?page=63'

i.e 'http://35.155.212.2:3000/companies?page=63'

The total number of pages may change from the currrent 129 as companies get added to, or removed from the model.


### Get a single company ###

GET `/companies/:ticker

Retrieve a JSON of the stock information of a specific company.

for instance, to retrieve information about the stock of Tesla Inc., you need to google what the ticker is, after you've found that it's 'TSLA', then use:

GET '/companies/TSLA'

for microsoft it would be:

GET '/companies/MSFT'

i.e 'http://35.155.212.2:3000/companies/MSFT'

and so on.


### create/add a new company ###

POST `/companies`

Allows you to add a new company to the model. Requires authentication.

A post request should be sent with all the required attributes as a JSON.
There are 6 required attributes: "ticker", "name", "price", "market_cap", "IPO_year", and "sector"

"market_cap" is a float, "IPO_year" is an integer, while all the other attributes are strings.
"price" has also been set to be string because of the "$" sign.

here is an example of how to create a new company called Dangote Industries:


use the  POST '/companies' endpoint
i.e http://35.155.212.2:3000/companies
then if you're using Postman,

select Body;
    select raw;
        select JSON

        Then enter the following JSON (an example):
    {
    "ticker": "DANGOTE",
    "name": "Dangote Industries",
    "price": "$2.45",
    "market_cap": 24383448880,
    "IPO_year": 2008,
    "sector": "Industrial Conglomerate"
    }

    Make sure it's a  POST request, then click send to send your request.


 Remember:

The request body needs to be in JSON format and include the following properties:

 - `ticker` - String - Required
 - `name` - String - Required
 - `price` - String - Required
 - `market_cap` - float - Required
 - `IPO_year` - Integer - Required
 - `sector` - String - Required

Example
```
POST /orders/
Authorization: Bearer <YOUR TOKEN>

{
  "bookId": 1,
  "customerName": "John"
}
```

The response body will contain the order Id.

### Edit/Update a company ###

PUT `/companies/ticker`

Allows you to edit a company. Requires authentication.

for instance, to edit Microsoft Corporation, you need to know their ticker a 'MSFT'
then senf a PUT request with a JSON of the 6 required attributes to:
PUT '/companies/MSFT'
i.e send a PUT request to 'http://35.155.212.2:3000/MSFT'


The request body needs to be in JSON format and include the following properties:

 - `ticker` - String - Required
 - `name` - String - Required
 - `price` - String - Required
 - `market_cap` - float - Required
 - `IPO_year` - Integer - Required
 - `sector` - String - Required

here is an example of how to edit an existing company called Dangote Industries:


use the  PUT '/companies/DANGOTE' endpoint
i.e http://35.155.212.2:3000/companies/DANGOTE
then if you're using Postman,

select Body;
    select raw;
        select JSON

        Then enter the following JSON (an example):
    {
    "ticker": "DANGOTE",
    "name": "Dangote Industries",
    "price": "$2.75",
    "market_cap": 24383448880,
    "IPO_year": 2008,
    "sector": "Industrial Conglomerate"
    }

    Make sure it's a  PUT request, then click send to send your request.

### Delete a company ###

DELETE `/companies/:ticker`

Delete an existing compnay. Requires authentication.

The request body needs to be empty.

 Example
```
DELETE '/companies/MSFT'
i.e To delete Microsoft Corporation, send a DELETE request to:

'http://35.155.212.2:3000/companies/MSFT'

make sure it's a DELETE request, then send.
Authorization: Bearer <YOUR TOKEN>
```

## API Authentication ##

To submit or view an order, you need to register your API client.

POST `/api-clients/`

The request body needs to be in JSON format and include the following properties:

 - `clientName` - String
 - `clientEmail` - String

 Example

 ```
 {
    "clientName": "Postman",
    "clientEmail": "valentin@example.com"
}
 ```

The response body will contain the access token. The access token is valid for 7 days.

**Possible errors**

Status code 409 - "API client already registered." Try changing the values for `clientEmail` and `clientName` to something else.

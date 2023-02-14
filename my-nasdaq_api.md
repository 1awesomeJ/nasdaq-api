# My Nasdaq API #

This API allows you to get stocks information about companies quoted on NASDAQ whose valuation are $2bn or higher.

The API is available at 'http://35.155.212.2:3000/'

## API Authentication##
Requests to post, edit, or delete a company require authentication.
So you need to create a user account in order to generate an authentication token.

To create a user account, send a POST request to http://35.155.212.2:3000/Auth/

with a JSON containing the following parameters: 
email: string -Required
password: string -Required
password_confirmation: string -Required
user_name: string
full_name: string

Here is an example:

{
    "email": "omojolajoshua@yahoo.com",
    "password": "awesome",
    "password_confirmation": "awesome",
    "full_name": "Joshua D OMOJOLA",
    "user_name": "Josh"
}
if you're sending the request as "raw" from "body" (on Postman), make sure to select type as JSON (not Texxt), also make sure to check for commas, colons, and double quotes where necessary. 
You may choose to use the params option intead and enter your details as key/value pairs.

Check the header of your response to extract your token in this form:

access-token: 1YrX1nmENs94qeTBIAYZ-w
token-type: Bearer
client: QjPpIjrVdU0-QdBsHcOBRg
expiry:167753998
uid: omojolajoshua@yahoo.com
Authorization: Bearer eyJhY2Nlc3MtdG9rZW4iOiIxWXJYMW5tRU5zOTRxZVRCSUFZWi13IiwidG9rZW4tdHlwZSI6IkJlYXJlciIsImNsaWVudCI6IlFqUHBJanJWZFUwLVFkQnNIY09CUmciLCJleHBpcnkiOiIxNjc3NTM5OTg3IiwidWlkIjoic2VydmljZXMuZ2d0cnVzdEBnYW1pbC5jb20ifQ==

copy the Authorization somewhere safely as you would include it in your subsequent POST, PUT and DELETE requests.


If you already have an account,
use POST '/Auth/sign_in' to sign in to your account.
The body of your POST request should include your correct email and password.

i.e send your email and password either as key/value pair or as JSON to http://35.155.212.2:3000/Auth/sign_in as a POST request.

check the header of your response if the sign in request is succesful, then extract your Authorization token from the header, so you can use it in your requests where required.
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

set a key/value on your header with key being 'Authorization' and the value being the Authorization token you got after sign in or sign up. Remember to check the header of your response for i after a successful sign in/up. while using the key/value option to set your authorization key in the header, you should put every part of the key including the string 'Bearer' that begins the key.

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


### Edit/Update a company ###

PUT `/companies/ticker`

Allows you to edit a company. Requires authentication.

set a key/value on your header with key being 'Authorization' and the value being the Authorization token you got after sign in or sign up. Remember to check the header of your response for i after a successful sign in/up. while using the key/value option to set your authorization key in the header, you should put every part of the key including the string 'Bearer' that begins the key.

To edit Microsoft Corporation, for instance, you need to know their ticker a 'MSFT'
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

set a key/value on your header with key being 'Authorization' and the value being the Authorization token you got after sign in or sign up. Remember to check the header of your response for i after a successful sign in/up. while using the key/value option to set your authorization key in the header, you should put every part of the key including the string 'Bearer' that begins the key.

The request body needs to be empty.

 Example
```
DELETE '/companies/MSFT'
i.e To delete Microsoft Corporation, send a DELETE request to:

'http://35.155.212.2:3000/companies/MSFT'

make sure it's a DELETE request, then send.

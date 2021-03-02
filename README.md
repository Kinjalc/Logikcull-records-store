# README
Description:
The record-store provides api endpoints to help users store Records information. This includes information like album title, artist name, the year record was released, the condition it is in (using Goldmine standards).

Api endpoints:
1) Create a new artist
  
    `POST` `'localhost:3000/api/v1/artists'  parameters: {"name"=>"coldplay"}`
    
    response: 
            `{
                "id": 4,
                "name": "coldplay"
            }`
 2) Update an artist
    
    `PATCH` `'localhost:3000/api/v1/artists/4' parameters: {"name"=>"Coldplay"}`
    
    response: 
            `{
                "id": 4,
                "name": "Coldplay"
             }`
            
  3) All artists
   
    
      `GET` `'localhost:3000/api/v1/artists'`

      response: 
              `[
                  {
                      "id": 4,
                      "name": "Coldplay"
                  },
                  {
                      "id": 3,
                      "name": "Enrique Iglesias"
                  },
                  {
                      "id": 2,
                      "name": "Ricky Martin"
                  },
                  {
                      "id": 1,
                      "name": "The Beatles"
                  }
                ]`
  4) Show an artist by id

       `GET` `'localhost:3000/api/v1/artists/4' `
    
      response: 
            `{
                "id": 4,
                "name": "Coldplay"
            }`
            
  5) Create a record
  
      `POST` ` localhost:3000/api/v1/records  Parameters: {"title"=>"Everyday life", "year"=>"2010", "condition"=>"mint", "artist_ids"=>["4"]}`
      
      response: 
                `{
                  "id": 11,
                  "title": "Everyday life",
                  "year": 2010,
                  "condition": "mint",
                  "artists": [
                      {
                          "id": 4,
                          "name": "Coldplay"
                      }
                  ]
              }`
              
       All the fields are required for creating a record. So create the artist associated first (if the artist doesn't already exist and then create the record.
       
      
  6) Update a record

     `PATCH` ` 'localhost:3000/api/v1/records/10'  Parameters: {"title"=>"", "year"=>"2010", "condition"=>"mint", "artist_ids"=>["4"]}`
     
     response:
              `{
                "id": 10,
                "title": "Livin a vida loca loca loca loca loca",
                "condition": "mint",
                "year": 2010,
                "artists": [
                    {
                        "id": 2,
                        "name": "Ricky Martin"
                    }
                ]
              }`
              
  7) All records
      
     `GET` ` 'localhost:3000/api/v1/records'`
     
     response: 
             `[
                  {
                      "id": 1,
                      "title": "Abbey Road",
                      "year": 1969,
                      "condition": "mint",
                      "artists": [
                          {
                              "id": 1,
                              "name": "The Beatles"
                          }
                      ]
                  },
                  {
                      "id": 3,
                      "title": "Everyday life",
                      "year": 2010,
                      "condition": "mint",
                      "artists": [
                          {
                              "id": 4,
                              "name": "Coldplay"
                          }
                      ]
                  },
                  {
                      "id": 2,
                      "title": "Livin a vida loca loca loca loca loca",
                      "year": 2010,
                      "condition": "mint",
                      "artists": [
                          {
                              "id": 2,
                              "name": "Ricky Martin"
                          }
                      ]
                  },
                  {
                      "id": 4,
                      "title": "road to magic",
                      "year": 1969,
                      "condition": "poor",
                      "artists": [
                          {
                              "id": 1,
                              "name": "The Beatles"
                          }
                      ]
                  }
              ]`
         
   8) Show record
     
       `PATCH` ` 'localhost:3000/api/v1/records/10'`
     
       response:
                `{
                  "id": 10,
                  "title": "Livin a vida loca loca loca loca loca",
                  "condition": "mint",
                  "year": 2010,
                  "artists": [
                      {
                          "id": 2,
                          "name": "Ricky Martin"
                      }
                  ]
                }`
     
    
   9) Delete record
      
        `DELETE` ` 'localhost:3000/api/v1/records/9'`
        
        response:
                 `{
                    "message": "Fact successfully deleted."
                  }`

   10) Search records
        `GET` `localhost:3000/api/v1/records/search?q=roa`
        
        response:
                `[
                  {
                      "id": 1,
                      "title": "Abbey Road",
                      "year": 1969,
                      "condition": "mint",
                      "artists": [
                          {
                              "id": 1,
                              "name": "The Beatles"
                          }
                      ]
                  },
                  {
                      "id": 2,
                      "title": "road to magic",
                      "year": 1969,
                      "condition": "poor",
                      "artists": [
                          {
                              "id": 1,
                              "name": "The Beatles"
                          }
                      ]
                    }
                  ]`
         
         The search queries against the `title` in records and `name` in artists and returns all the matching records
                  
   11) Most common word

        `GET` `localhost:3000/api/v1/records/most_common_word`
  
        response: 
                 `{
                    "most_common_word": [
                        "downtown",
                        "loca"
                    ],
                    "frequency": 5
                  }`
                  
         It returns most common word(s) and it's frequency.


* Ruby version: 
    ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin19]

* Database:
    Postgres

* How to run the test suite
    `rspec spec/api/v1/records/create_request_spec.rb`

* Gems:
     'kaminari'(pagination), 'ransack'(search)
     'rspec-rails', 'faker', 'factory_bot_rails', 'database_cleaner' (tests)

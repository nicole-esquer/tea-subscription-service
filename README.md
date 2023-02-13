[![Rails][rails]][rails-url] [![Postman][postman]][postman-url] [![Git][git]][git-url] [![Markdown][markdown]][markdown-url] [![PostgreSQL][postgreSQL]][postgresql-url] [![RSpec][rspec]][rspec-url] [![Visual Studio Code][visual studio code]][visual studio code-url]

<h1>Tea Subscription Service</h4>


Tea Subscription Service is a Rails API where customers are able to subscribe, update, and cancel their tea subscription services.

<a name="readme-top"></a>

<h2> Table of Contents</h2>
<details open="open">
<summary>Table of Contents</summary>
  <ol>
    <li><a href="#technical-requirements"> Technical Requirements</a></li>
    <li><a href="#gems-and-tools"> Gems and Tools</a></li>
    <li><a href="#installation"> Installation</a></li>
    <li><a href="#schema"> Schema</a></li>
    <li><a href="#endpoints"> API Endpoints</a></li>
    <li><a href="#testing"> Testing</a></li>
  </ol>
</details>

<h2 id="technical-requirements">Technical Requirements</h2>
<ul>
<li>Ruby 2.7.4</li>
<li>Rails 5.2.8</li>
</ul>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h2 id="gems-and-tools">Gems and Tools</h2>
<ul>
  <li><a href="https://github.com/pry/pry">Pry</a></li>
  <li><a href="https://github.com/simplecov-ruby/simplecov">SimpleCov</a></li>
  <li><a href="https://github.com/thoughtbot/shoulda-matchers">Shoulda Matchers</a></li>
</ul>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h2 id="installation">Installation</h2>
To get started, clone the repo in your terminal by entering the following:

<ul>
  <li>git clone git@github.com:nicole-esquer/tea-subscription-service.git</li>
</ul>  
   
Once cloned, run the following commands:
<ul>
  <li>bundle install</li>
  <li>rails db:create</li>
  <li>rails db:migrate</li> 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h2 id="schema"> Schema</h2>
<img alt="Database Schema" src="https://user-images.githubusercontent.com/98506079/210481457-369b7370-5730-4393-a2af-6ae7ce365f08.png">
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h2 id="endpoints"> Endpoints</h2>
Create a new subscription.<br>
POST /api/v1/#{customer.id}/subscriptions

```ruby
    "data": {
        "type": "subscriptions",
        "id": 2,
        "attributes": {
            "title": "Flavorful, delicious teas of India",
            "price": 15.5,
            "status": "active",
            "frequency": "quarterly"
        }
```

Cancel a subscription.<br>
PATCH /api/v1/#{customer.id}/subscriptions

```ruby
    "data": {
        "type": "subscriptions",
        "id": 2,
        "attributes": {
            "title": "Flavorful, delicious teas of India",
            "price": 15.5,
            "status": "cancelled",
            "frequency": "quarterly"
        }
```

Get all subscriptions, active and cancelled.<br>
GET /api/v1/#{customer.id}/subscriptions

```ruby
    "data": {
        "type": "customers",
        "id": 1,
        "attributes": {
            "first_name": "Tea",
            "last_name": "Lover",
            "email": "tealover@mail.com",
            "address": "123 Boiling Kettle Lane, Tucson, AZ 85705",
            "subscriptions": [
                {
                    "title": "Flavorful, delicious teas of India",
                    "price": 15.5,
                    "status": "cancelled",
                    "frequency": "quarterly"
                },
                {
                    "title": "Green Rush",
                    "price": 10.5,
                    "status": "active",
                    "frequency": "biweekly"
                }
            ]
        }
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h2 id="testing"> Testing</h2>
To test coverage, run the following command in your terminal:
<ul>
  <li>bundle exec rspec</li>
or
  <li>open coverage/index.html</li>
</ul> 

[Rails]: https://camo.githubusercontent.com/1ab1a7ec3f2dd01c7960044047e96a86aed5111004c9b0b86e852eac461bedac/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f527562795f6f6e5f5261696c732d4343303030303f7374796c653d666f722d7468652d6261646765266c6f676f3d727562792d6f6e2d7261696c73266c6f676f436f6c6f723d7768697465
[rails-url]: https://guides.rubyonrails.org/

[Postman]: https://camo.githubusercontent.com/3f0e26b0951bab845a1bb9a7198ecca0da272e462921b6edd85879f3673b6927/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f506f73746d616e2d4646364333373f7374796c653d666f722d7468652d6261646765266c6f676f3d706f73746d616e266c6f676f436f6c6f723d7768697465
[postman-url]: https://www.postman.com/

[Git]: https://user-images.githubusercontent.com/64919819/113648232-81d60d00-9649-11eb-8ea4-0ff5e399afb6.png
[git-url]: https://git-scm.com/doc

[Markdown]: https://camo.githubusercontent.com/510a057988cb5216f5d297ee202f6a08fa179798926cea28e95910f6b8ca5535/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4d61726b646f776e2d3030303030303f7374796c653d666f722d7468652d6261646765266c6f676f3d6d61726b646f776e266c6f676f436f6c6f723d7768697465
[markdown-url]: https://www.markdownguide.org/

[PostgreSQL]: https://camo.githubusercontent.com/281c069a2703e948b536500b9fd808cb4fb2496b3b66741db4013a2c89e91986/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f506f737467726553514c2d3331363139323f7374796c653d666f722d7468652d6261646765266c6f676f3d706f737467726573716c266c6f676f436f6c6f723d7768697465
[postgresql-url]: https://www.postgresql.org/docs/

[RSpec]: https://user-images.githubusercontent.com/64919819/113648167-6965f280-9649-11eb-8794-0f1082ae8d1c.png
[rspec-url]: https://rspec.info/documentation/

[visual studio code]: https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white
[visual studio code-url]: https://code.visualstudio.com/
<p align="right">(<a href="#readme-top">back to top</a>)</p>

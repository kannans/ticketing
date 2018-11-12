### Create ticket using post API
```
curl -X POST  -H "Accept: Application/json" -H "Content-Type: application/json" http://localhost:3000/api/tickets/ -d '{
"ContactCenter": "xxx", "RequestNumber": "yyy" }'

```

* Ruby version
  - ruby "2.5.0"
  - rails "5.2.1"
  
* Database creation
  - postgresql 10
  - rails db:setup
  
* Test cases
   - rspec

* PolygonMap
  ![intersect](https://github.com/kannans/ticketing/raw/master/map.jpg)

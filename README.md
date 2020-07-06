###### **Native Ruby with RSpec framework example by Sergey Kievskiy**

*****
**Run commands:**


$ `docker-compose up -d  masterpay` run container

$ `docker exec -ti masterpay rspec` - run all tests

$ `docker exec -ti masterpay rspec -f d`  - run all tests format reporting 'document'

*****
 run this command in cloned project directory

    bundle install 

 run only once thread (default)
    
    rspec  

 runninsg parallel tests (CPU)
    
    parallel_test spec -t rspec

 running parallel tests, set 10 threads

    parallel_test spec -t rspec -n10 
*****
**Recommended:**

* Ruby 2.5.+
* Docker 19.03.8+
* Docker compose 1.25.5+
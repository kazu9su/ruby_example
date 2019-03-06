# RubyExample

This is an example implemantaion of ruby

# What I did
I simply implemented a model satisfying below spec.

# Definition
* A banner class which has a public method to determine display banner itself or not
* An instance can create by attributes and usually created by json
* Banner can display itself during the available period
* If specific ip is included in the attributes, it can show itself even before the period
* Except for that, it cannot display itself
* The time format of it is ISO8601
* The permitted ips are '10.0.0.1', and '10.0.0.2'
* A sample attributes is below

```
{
  id: 1,
  title: 'Banner for Chrismas campain',
  start_at: '2018-12-20T00:00:00+0900',
  end_at: '2018-12-26T00:00:00+0900',
}
```

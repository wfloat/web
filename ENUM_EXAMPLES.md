```typescript
export enum Weekdays {
    Friday = "Friday",
    Monday = "Monday",
    Saturday = "Saturday",
    Sunday = "Sunday",
    Thursday = "Thursday",
    Tuesday = "Tuesday",
    Wednesday = "Wednesday",
}
```

```json
{
  "type": "object",
  "properties": {
    "weekdays": {
      "type": "string",
      "enum": [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
      ],
      "qt-enum-values": {
        "Monday": "1",
        "Tuesday": "2",
        "Wednesday": "3",
        "Thursday": "4",
        "Friday": "5",
        "Saturday": "6",
        "Sunday": "7"
      }
    }
  },
  "required": [
    "weekdays"
  ]
}
```

------------------------------------------------

```typescript
export enum Enum {
    Bar = "bar",
    Foo = "foo",
}
```

```json
{
  "type": "object",
  "additionalProperties": false,
  "properties": {
    "enum": {
      "type": ["string", "null"],
      "enum": ["foo", "bar", null]
    }
  },
  "required": ["enum"]
}
```
------------------------------------------------
```typescript
export enum FooEnum {
    A = "a",
    B = "b",
    C = "c",
}
```

```json
{
    "type": "object",
    "properties": {
        "foo": {
            "enum": [
                1,
                2,
                true,
                "a",
                "b",
                "c"
            ]
        }
    },
    "required": [
        "foo"
    ]
}
```

--------------------------------------
ruby

```ruby
module FooEnum
  A = "a"
  B = "b"
  C = "c"
end
```

---------------------------------------

```ruby
module Types
  include Dry.Types(default: :nominal)

  Integer  = Strict::Integer
  Hash     = Strict::Hash
  String   = Strict::String
  OtherArr = Strict::String.enum("bar", "foo", "if")
  Gve      = Strict::String.enum("evil", "good", "neutral")
  Lvc      = Strict::String.enum("chaotic", "lawful", "neutral")
end


module OtherArr
  Bar = "bar"
  Foo = "foo"
  If  = "if"
end
```


```ruby
  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    if enum != nil
      enum
    elsif integer != nil
      integer
    end
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module Gve
  Evil    = "evil"
  Good    = "good"
  Neutral = "neutral"
end

module Lvc
  Chaotic = "chaotic"
  Lawful  = "lawful"
  Neutral = "neutral"
end
```
----------------------------------
```ruby
module Types
  include Dry.Types(default: :nominal)

  Hash     = Strict::Hash
  String   = Strict::String
  Weekdays = Strict::String.enum("Friday", "Monday", "Saturday", "Sunday", "Thursday", "Tuesday", "Wednesday")
end

module Weekdays
  Friday    = "Friday"
  Monday    = "Monday"
  Saturday  = "Saturday"
  Sunday    = "Sunday"
  Thursday  = "Thursday"
  Tuesday   = "Tuesday"
  Wednesday = "Wednesday"
end

class TempMulti < Dry::Struct
  attribute :weekdays, Types::Weekdays

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      weekdays: d.fetch("weekdays"),
    )
  end
```

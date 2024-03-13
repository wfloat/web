export enum Weekdays {
    Friday = "Friday",
    Monday = "Monday",
    Saturday = "Saturday",
    Sunday = "Sunday",
    Thursday = "Thursday",
    Tuesday = "Tuesday",
    Wednesday = "Wednesday",
}

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

------------------------------------------------


export enum Enum {
    Bar = "bar",
    Foo = "foo",
}

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

------------------------------------------------

export enum FooEnum {
    A = "a",
    B = "b",
    C = "c",
}

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

--------------------------------------
ruby

module FooEnum
  A = "a"
  B = "b"
  C = "c"
end

---------------------------------------

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

----------------------------------


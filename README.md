# Insultario (BackEnd)

## API

```
$ curl -X POST "http://insultario.com.pizza/front/users"
{
  "uuid": "a9a790812d6f3c5d"
}

$ curl -X GET "http://insultario.com.pizza/front/users/a9a790812d6f3c5d/insults"
[]

$ rails c
Loading development environment (Rails 5.2.1)
irb(main):001:0> user = User.find_by(:uuid => "a9a790812d6f3c5d")
irb(main):002:0> user.load_more_insults(5)

$ curl -X GET "http://insultario.com.pizza/front/users/a9a790812d6f3c5d/insults"
[
  {
    "user": {
      "uuid": "a9a790812d6f3c5d"
    },
    "insult": {
      "uuid": "75277e86ba70a4c4",
      "text": "Ten la decencia que hay que tener y, si el aguardiente todavía te permite coordinar tu cuerpo, baja a la calle y quita el coche de la zona de minusválidos."
    },
    "readed": false,
    "loved": false
  },
  {
    "user": {
      "uuid": "a9a790812d6f3c5d"
    },
    "insult": {
      "uuid": "cdf34f5546e7f468",
      "text": "Hoy es uno de esos días raros que te has levantado seco."
    },
    "readed": false,
    "loved": false
  }
  ...
]

$ curl -X PUT "http://insultario.com.pizza/front/users/a9a790812d6f3c5d/insults/75277e86ba70a4c4/mark_as_readed"
{
  "user": {
    "uuid": "a9a790812d6f3c5d"
  },
  "insult": {
    "uuid": "75277e86ba70a4c4",
    "text": "Ten la decencia que hay que tener y, si el aguardiente todavía te permite coordinar tu cuerpo, baja a la calle y quita el coche de la zona de minusválidos."
  },
  "readed": true,
  "loved": false
}

$ curl -X PUT "http://insultario.com.pizza/front/users/a9a790812d6f3c5d/insults/75277e86ba70a4c4/mark_as_readed"
{
  "user": {
    "uuid": "a9a790812d6f3c5d"
  },
  "insult": {
    "uuid": "75277e86ba70a4c4",
    "text": "Ten la decencia que hay que tener y, si el aguardiente todavía te permite coordinar tu cuerpo, baja a la calle y quita el coche de la zona de minusválidos."
  },
  "readed": true,
  "loved": false
}

$ curl -X PUT "http://insultario.com.pizza/front/users/a9a790812d6f3c5d/insults/75277e86ba70a4c4/mark_as_loved"
{
  "user": {
    "uuid": "a9a790812d6f3c5d"
  },
  "insult": {
    "uuid": "75277e86ba70a4c4",
    "text": "Ten la decencia que hay que tener y, si el aguardiente todavía te permite coordinar tu cuerpo, baja a la calle y quita el coche de la zona de minusválidos."
  },
  "readed": true,
  "loved": true
}

$ curl -X PUT "http://insultario.com.pizza/front/users/a9a790812d6f3c5d/insults/75277e86ba70a4c4/mark_as_unloved"
{
  "user": {
    "uuid": "a9a790812d6f3c5d"
  },
  "insult": {
    "uuid": "75277e86ba70a4c4",
    "text": "Ten la decencia que hay que tener y, si el aguardiente todavía te permite coordinar tu cuerpo, baja a la calle y quita el coche de la zona de minusválidos."
  },
  "readed": true,
  "loved": false
}
```

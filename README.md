# Onesky

[![Build Status](https://travis-ci.org/ahtung/onesky.ex.svg?branch=master)](https://travis-ci.org/ahtung/onesky.ex)
[![Coverage Status](https://coveralls.io/repos/ahtung/onesky.ex/badge.svg?branch=master)](https://coveralls.io/r/ahtung/onesky.ex?branch=master)
[![Hex.pm version](https://img.shields.io/hexpm/v/onesky.svg?style=flat-square)](https://hex.pm/packages/onesky)
[![Hex.pm downloads](https://img.shields.io/hexpm/dt/onesky.svg)](https://hex.pm/packages/onesky)

Elixir's OneSky API client.

Documentation can be found [here](https://hexdocs.pm/onesky).

## Installation

Add the following to your `mix.exs` file

```elixir
def deps do
  [
    {:onesky, "~> 0.16.1"}
  ]
end
```

And run `mix deps.get`

## Configuration

```elixir
config :onesky,
  api_key: "YOUR_API_KEY",
  api_secret: "YOUR_API_SECRET"
```

## Resources

**Project**
- **Project Group**
    - ~~LIST all project groups~~
    - ~~SHOW project group details~~
    - ~~CREATE a new project group~~
    - ~~DELETE a project group~~
    - ~~list enabled LANGUAGES~~
- **Project**
    - ~~LIST projects of a project group~~
    - ~~SHOW project details~~
    - ~~CREATE a new project~~
    - ~~UPDATE a project~~
    - ~~DELETE a project~~
    - ~~list LANGUAGES of a project~~
- **Project Type**
    - ~~LIST all project types~~

**String**
- **File**
    - ~~LIST uploaded files~~
    - ~~UPLOAD a file~~
    - ~~DELETE a file~~
- **Translation**
    - ~~EXPORT translations in files~~
    - export translations in MULTILINGUAL files
    - ~~export translations of APP STORE Description~~
    - ~~GET translation status~~
- **Import Task**
    - ~~LIST import tasks~~
    - ~~SHOW import task~~
- **Screenshot**
    - ~~UPLOAD screenshots~~

**Order**
- **Quotation**
    - ~~SHOW a quotation~~
- **Order**
    - ~~LIST all orders~~
    - ~~SHOW order details~~
    - ~~CREATE an order~~

**Language**
- **Locale**
    - ~~LIST all locales~~

## Contribute

Please feel free to fork and send us a PR or open up an issue.

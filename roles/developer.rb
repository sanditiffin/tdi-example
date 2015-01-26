name "developer"
description "development machine"
run_list(
  "recipe[irc]",
  "recipe[git]",
  "recipe[chruby::system]",
  "recipe[virtualbox]",
  "recipe[vagrant]"
)

default_attributes(
  "chruby" => {
    "rubies" => {
      "1.9.3-p392" => true,
      "2.0.0-p481" => true
    },
    "default" => "2.0.0-p481"
  }
)

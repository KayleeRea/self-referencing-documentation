require_relative '../lib/dictionary'
require 'json'

data = File.read('../data/dictionary.json')

parsed_data = JSON.parse(data)

p parsed_data


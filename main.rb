# frozen_string_literal: true

require 'open-uri'
require_relative 'lib/film_collection'

COUNT_DIRECTORS = 10
TOP_250_FILMS = File.read(File.join(__dir__, 'data', 'link_wiki_top_250.txt'))

def save_html_to_xml(uri)
  URI.open(uri).read
end

xml_data = save_html_to_xml(TOP_250_FILMS)

film_collection = FilmCollection.read_from_xml(xml_data)

puts 'Программа "Фильм на вечер"'
puts
puts film_collection.show_directors(COUNT_DIRECTORS)
user_index = $stdin.gets.to_i

until user_index.between?(1, COUNT_DIRECTORS)
  print "Введите число от 1 до #{COUNT_DIRECTORS}: "
  user_index = $stdin.gets.to_i
end

guessed_director = film_collection.user_guess(user_index)

puts
puts 'И сегодня вечером рекомендую посмотреть:'
puts film_collection.select_film(guessed_director)

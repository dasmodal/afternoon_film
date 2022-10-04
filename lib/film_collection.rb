# frozen_string_literal: true

require 'nokogiri'
require_relative 'film'

class FilmCollection
  attr_reader :directors, :films

  def self.read_from_txt(file_paths)
    films =
      file_paths.map do |file_path|
        lines = File.readlines(file_path, chomp: true)
        title, director, year = *lines

        Film.new(title, director, year)
      end

    new(films)
  end

  def self.read_from_xml(data)
    data = Nokogiri::HTML(data)

    films =
      data.xpath('//tbody/tr').drop(1).map do |film|
        title, year, director = film.xpath('td').map { |elem| elem.text.chomp }[1, 3]

        Film.new(title, director, year)
      end

    new(films)
  end

  def initialize(films)
    @directors = films.map(&:director).uniq
    @films = films
  end

  def show_directors(count_directors)
    @director_options = @directors.sample(count_directors)
    @director_options.map.with_index(1) { |director, index| "#{index}. #{director}" }
  end

  def select_film(director)
    @films.select { |film| film.director == director }.sample
  end

  def user_guess(index)
    @director_options[index - 1]
  end
end

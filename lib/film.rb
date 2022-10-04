# frozen_string_literal: true

class Film
  attr_reader :director, :title, :year

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year.to_i
  end

  def to_s
    "#{@director} - #{@title} (#{@year})"
  end
end

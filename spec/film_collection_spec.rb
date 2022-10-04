# frozen_string_literal: true

require 'spec_helper'

describe FilmCollection do
  let(:film1) { Film.new('Паразиты', 'Пон Чжун Хо', '2019') }
  let(:film2) { Film.new('Memento', 'Christopher Nolan', '2000') }
  let(:film_collection) { described_class.new([film1, film2]) }
  let(:ordered_directors_list) { film_collection.show_directors(2) }

  describe '::read_from_txt' do
    let(:film_collection) do
      file_paths = Dir[File.join(__dir__, 'fixtures', '*.txt')].sort
      described_class.read_from_txt(file_paths)
    end

    it 'returns film_collection' do
      expect(film_collection).to be_an described_class
    end

    it 'has two directors' do
      expect(film_collection.directors.size).to eq 2
    end

    it 'has attributes' do
      expect(film_collection.films)
        .to contain_exactly(
          an_object_having_attributes(title: 'Паразиты', director: 'Пон Чжун Хо', year: 2019),
          an_object_having_attributes(title: 'Memento', director: 'Christopher Nolan', year: 2000)
        )
    end

    it 'has contain only Film object' do
      expect(film_collection.films).to all be_a Film
    end
  end

  describe '#show_directors' do
    it 'returns array' do
      expect(ordered_directors_list).to be_an Array
    end

    it 'generates ordered list' do
      ordered_directors_list.each.with_index(1) do |position, id|
        expect(position).to match(/\A#{id}. /)
      end
    end

    it 'takes directors to list items' do
      ordered_directors_list.each.with_index(1) do |position, id|
        expect(film_collection.directors).to include position.gsub(/\A#{id}. /, '')
      end
    end

    it 'takes different directors' do
      filtered_directors =
        ordered_directors_list.map.with_index(1) do |position, id|
          position.gsub(/\A#{id}. /, '')
        end

      expect(filtered_directors.uniq).to eq filtered_directors
    end
  end

  describe '#select_film' do
    let(:director) { 'Пон Чжун Хо' }

    it 'returns film' do
      expect(film_collection.select_film(director)).to be_an Film
    end

    it 'returns special film' do
      expect(film_collection.select_film(director)).to eq film1
    end
  end

  describe '#user_guess' do
    let(:film_collection) { described_class.new([film1]) }
    before { film_collection.show_directors(2) }
    let(:choised_director) { film_collection.user_guess(1) }

    it 'should return string' do
      expect(choised_director).to be_an String
    end

    it 'should return director name' do
      expect(choised_director).to eq 'Пон Чжун Хо'
    end
  end
end

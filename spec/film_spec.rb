# frozen_string_literal: true

require 'spec_helper'

describe Film do
  let(:film1) { Film.new('Memento', 'Christopher Nolan', '2000') }
  let(:film2) { Film.new('Паразиты', 'Пон Чжун Хо', '2019') }

  describe '#to_s' do
    it 'returns string' do
      expect(film1.to_s).to be_an String
    end

    it 'show info with russian text' do
      expect(film2.to_s).to eq 'Пон Чжун Хо - Паразиты (2019)'
    end

    it 'show info with english text' do
      expect(film1.to_s).to eq 'Christopher Nolan - Memento (2000)'
    end
  end

  describe '#director' do
    it 'returns string' do
      expect(film1.director).to be_an String
    end

    it 'returns director' do
      expect(film1.director).to eq 'Christopher Nolan'
    end
  end
end

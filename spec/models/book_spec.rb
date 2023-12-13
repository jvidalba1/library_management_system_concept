require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { build(:book) }

  describe 'validations' do
    it 'is valid with all attributes' do
      expect(book).to be_valid
    end

    it 'is invalid without title' do
      book.title = ''
      expect(book).to be_invalid
    end

    it 'is invalid without isbn' do
      book.isbn = ''
      expect(book).to be_invalid
    end
  end
end

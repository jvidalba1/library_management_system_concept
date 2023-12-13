require 'rails_helper'

RSpec.describe User, type: :model do
  let(:librarian) { build(:librarian) }

  describe '#validations' do
    it 'is valid with valid attributes' do
      expect(librarian).to be_valid
    end

    it 'is invalid without email' do
      librarian.email = ''
      expect(librarian).to be_invalid
    end

    it 'is invalid without password' do
      librarian.password = ''
      expect(librarian).to be_invalid
    end

    it 'is invalid with a different type' do
      librarian.type = 'Consultant'
      expect(librarian).to be_invalid
    end
  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:brand) }
    it { should validate_presence_of(:released_date) }
    it { should validate_presence_of(:ram) }
    it { should validate_presence_of(:external_storage) }
  end

  context 'Association' do
    it { should belong_to(:user) }
  end

end

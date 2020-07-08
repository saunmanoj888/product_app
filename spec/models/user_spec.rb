require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  context 'Association' do
    it { should have_many(:products) }
  end

end

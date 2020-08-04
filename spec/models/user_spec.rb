# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end

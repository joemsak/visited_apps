require 'rails_helper'

RSpec.describe User do
  it { should have_many(:apps).through(:apps_users) }
end

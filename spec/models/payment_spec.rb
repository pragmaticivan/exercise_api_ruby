require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe "assossiations" do
    it { should belong_to(:loan) }
  end
end

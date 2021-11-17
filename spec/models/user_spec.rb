require 'rails_helper'

class User
  def initialize(args = {}); end

  def email
    'someone@example.com'
  end

  def password
    12021679918
  end
end

describe User do
  describe "#initialize" do
    it "expects email and password param for user" do
      u = User.new email: 'someone@example.com', password: 12021679918
      expect(u.email).to eq('someone@example.com')
      expect(u.password).to eq(12021679918)
    end
  end
end

require 'spec_helper'

describe Authentication do
  describe "associations" do
    it { should belong_to(:user) }
  end
end
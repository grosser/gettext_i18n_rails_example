require "spec/spec_helper"

describe 'cars' do
  it "renders index" do
    assigns[:cars] = [create_valid(Car)]
    render "cars/index"
  end
end
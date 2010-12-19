require "spec/spec_helper"

describe 'cars/index' do
  it "renders index" do
    @cars = [create_valid(Car)]
    render
  end
end
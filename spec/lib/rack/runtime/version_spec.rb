require "spec_helper"

describe Rack::Runtime::VERSION do
  it "should be a string" do
    expect(Rack::Runtime::VERSION).to be_kind_of(String)
  end
end

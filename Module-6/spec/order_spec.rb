require_relative '../lib/refactoring/order'

describe Order do
  it "has a version number" do
    expect(Refactoring::VERSION).not_to be nil
  end
end

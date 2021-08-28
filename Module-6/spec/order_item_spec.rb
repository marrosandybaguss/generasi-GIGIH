require_relative '../lib/refactoring/order_item'

describe OrderItem do
  it "has a version number" do
    expect(Refactoring::VERSION).not_to be nil
  end
end

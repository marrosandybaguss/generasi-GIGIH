require '../db/db_connector'

class Order
    attr_accessor :reference_no, :customer_name, :date

    def initialize(reference_no, customer_name, date)
        @reference_no = reference_no
        @customer_name = customer_name
        @date = date
    end

    def self.get_all_orders
        client = create_db_client
        rawData = client.query("select * from orders")
        orders = Array.new

        rawData.each do |data|
            orders.push(Order.new(data["reference_no"], data["customer_name"], data["date"]))
        end
        orders
    end

    def save
        return false unless valid?

        client = create_db_client
        client.query("insert into orders(reference_no, customer_name, date values ('#{@reference_no}', '#{@customer_name}', '#{@date}')")
    end

    def valid?
        return false if @reference_no.nil?
        return false if @customer_name.nil?
        return false if @date.nil?
        true
    end
end
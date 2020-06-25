require 'test_prof/recipes/rspec/any_fixture'

module FixturesFactory
  FIXTURES = {}

  # def self.fixture(*args, currency, amount)
  #   FIXTURES.fetch(*args) do
  #     Services::Invoices::Create::V2.new.call(currency, amount)
  #   end
  # end

  # payments
  def call_payments(*args, params)
    FIXTURES[args] ||= TestProf::AnyFixture.register(args) do
      Services::API::V1::Payments.new.call(params)
    end
  end
end

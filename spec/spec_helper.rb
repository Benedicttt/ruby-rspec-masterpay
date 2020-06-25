require 'bundler/setup'
require 'bigdecimal'
require 'dotenv/load'
require 'json-schema'
require 'rest_client'
require 'json'
require 'shoulda'
require 'shoulda/matchers'
require 'rspec'
require 'rspec/its'
require 'restclient'
require 'net/ssh'
require 'pry'
require 'allure-rspec'
require 'active_support'
require 'active_support/core_ext/module'
require 'test_prof/recipes/rspec/any_fixture'
require 'colorize'
require 'dry/schema'
require 'dry/validation'
require 'colorize'
require 'colorized_string'
require 'ostruct'

Dir['./spec/support/**/**/*.rb',].each { |f| require f }

Dotenv.load('./env/.env')

# This file was generated by the rails generate rspec:install command.
# Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

RSpec.configure do |config|
  config.include AllureRSpec::Adaptor

  config.filter_run :focus
  config.threadsafe = true
  # config.example_status_persistence_file_path = "./tmp/rspec_examples.txt"

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.run_all_when_everything_filtered = true
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end
=begin
  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.

  # The settings below are suggested to provide a good initial experience
  # with RSpec, but feel free to customize to your heart's content.
  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run. RSpec also provides
  # aliases for `it`, `describe`, and `context` that include `:focus`
  # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  # config.filter_run_when_matching :focus

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = 'spec/examples.txt'

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end

  # config.include Operations
  config.include FixturesFactory
  # config.include Helpers::Invoices::V2
  config.include Services::API::V1
  # config.include Helpers::Tickers

  # config.before :context do
  #   user = register_user_and_return_api_key(:once)
  #   ENV['USER'] = user.to_json
  #   ENV['API_KEY'] = user['api_key']
  #
  #   ENV['USER'].nil? && ENV['API_KEY'].nil? ? "#{raise 'User not created'}" : nil
  # end
end

AllureRSpec.configure do |c|
  c.output_dir = "./result" # default: gen/allure-results
  c.clean_dir = false # clean the output directory first? (default: true)
  c.logging_level = Logger::INFO # logging level (default: DEBUG)
end

# fetch some test files from API and add to cli_args
# RSpec::Matchers.define :match_response_schema do |schema|
#   match do |response|
#     schema_directory = "#{Dir.pwd}/spec/schemas"
#     schema_path = "#{schema_directory}/#{schema}.json"
#     JSON::Validator.validate!(schema_path, response, strict: true)
#
#   rescue
#     $!.message << <<-MESSAGE
#     #{ puts response_json }
#     #{ "To current payments: #{ENV['APP_HOST_ADMIN']}invoices/#{response_uuid}" }
#     #{ pp 'UUID payments: ' + response_json['uuid'] }
#     #{ pp 'BTC amount in payments: ' + response_json['btc_price'].to_s }
#     #{ received = client.info_bitcoin_address(response_uuid)['received_cents'].to_i if currency == 'BTC'
#     received = client.info_bitcoin_address(response_uuid)['received_cents'].to_i * 0.00000001 if currency != 'BTC'
#     pp 'BitCoin detail: received = ' + received.to_s}
#     #{ pp 'In file: ' + __FILE__.to_s + ":" + __LINE__.to_s }
#     MESSAGE
#     raise
#   end
# end

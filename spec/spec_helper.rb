require 'vcr'
require 'webmock/rspec'

RSpec.configure do |config|
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.hook_into :webmock
end


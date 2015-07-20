$LOAD_PATH << File.dirname(File.dirname(__FILE__))

require "macbeth_analyzer"
require "webmock/rspec"

WebMock.disable_net_connect!(allow_localhost: true)

Dir["spec/support/*.rb"].each { |f| require f }
require 'json'
require 'rack'

REQUESTS = []

class CallbackReceiver
  def call(env)
    REQUESTS << Rack::Request.new(env)

    [200, { 'Content-Type' => 'application/json' }, ['OK']]
  end
end

class CallbackPrinter
  def call(env)
    requests = REQUESTS.map do |req|
      req.body.rewind
      {
          method: req.request_method,
          ip: req.ip,
          body: req.body.read,
          path: req.fullpath
      }
    end

    [200, { 'Content-Type' => 'application/json' }, [requests.to_json]]
  end
end

class CallbackClearAll
  def call(env)
    REQUESTS.clear

    [200, { 'Content-Type' => 'application/json' }, [REQUESTS.to_json]]
  end
end

app = Rack::Builder.new do
  use Rack::CommonLogger

  map '/show/callbacks' do
    run CallbackPrinter.new
  end

  map '/add/callbacks' do
    run CallbackReceiver.new
  end

  map '/clear/all/callbacks' do
    run CallbackClearAll.new
  end
end

run app

# docker stop server-callbacks
# docker rm -vf server-callbacks
# dcm up server-callbacks

require 'rack-stream'

class Firehose
  include Rack::Stream::DSL

  def call(env)
    after_open do
      chunk "\nChunky Monkey"
      close  # start closing the connection
    end

    before_chunk do |chunks|
      chunks.map(&:upcase)  # manipulate chunks
    end

    before_close do
      chunk "\nGoodbye!"  # send something before we close
    end

    [200, {'Content-Type' => 'text/plain'}, ['Hello']]
  end
end

require 'zmq'

module Triage
  class ZmqClient

    def initialize(uri)
      @context = ZMQ::Context.create(1)
      @socket = @context.socket(ZMQ::PUB)
    end

    def send(msg)
      @socket.send(msg.to_msgpack)
    end

  end
end

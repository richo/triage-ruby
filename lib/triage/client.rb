module Triage
  class Client

    attr_reader :client

    def initialize(uri)
      @client = ZmqClient.new(uri)
    end

    def log_error(error)
      send({
        'error' => error
      })
    end

    def log_message(level, message)
      send({
        'level' => level,
        'message' => message
      })
    end

  private

    def send(message)
      message['time'] = Time.now
      @client.send(message.to_msgpack)
    end

  end
end

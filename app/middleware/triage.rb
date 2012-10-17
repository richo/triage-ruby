module Triage
  class Middleware

    def ininitialize(app)
      # TODO Client URI
      @logger = Client.new(uri)
      @app = app
    end

    def call(env)
      @app.call(env)
    rescue Exception => e
      @logger.log_error(e)
    end

  end
end


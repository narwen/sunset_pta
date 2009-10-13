class ForceHttps
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['HTTP_X_FORWARDED_PROTO'] == 'https'
      @app.call(env)
    else
      request = Rack::Request.new(env)
      https_location = "https://" + request.host + (request.port == 80 ? "" : ":#{request.port}") + request.fullpath
      ["301",
       {"Location" => https_location,
         "Content-Type" => "text/plain"},
       "Redirecting to a secure location."]
    end
  end
end

# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
use Rack::CanonicalHost, 'www.valentin-rota.ch' if Rails.env == 'production'
run Collaide::Application

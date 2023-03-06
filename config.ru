require "rubygems"
require "rack"

use Rack::Static, :urls => {"/" => "index.html"}, :root => "public"
run Proc.new { |env| [200, {"Content-Type" => "text/html"}, [""]] }
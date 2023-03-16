require "rubygems"
require "rack"

use Rack::Static, :urls => [""], :root => 'public', :index => 'index.html'
run Proc.new { |env| [200, {}, [""]] }
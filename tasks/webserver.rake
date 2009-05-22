desc "run the webserver for tests on win32"
task :webserver do
  require 'webrick'
  include WEBrick

  s = HTTPServer.new(
    :Port            => 81,
    :DocumentRoot    => SITE.output_dir
  )

  trap("INT"){ s.shutdown }
  s.start
end

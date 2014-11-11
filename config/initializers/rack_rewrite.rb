RehactivePage::Application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
  r301 %r{.*}, 'http://www.rehactive.pl$&', :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] == 'rehactive.pl'
  }
end


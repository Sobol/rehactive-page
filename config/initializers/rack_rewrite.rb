RehactivePage::Application.config.middleware.insert_before(Rack::Lock, Rack::Rewrite) do
  unless Rails.env.development?
    r301 %r{.*}, 'http://www.rehactive.pl$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] == 'rehactive.pl'
    }
  end
end

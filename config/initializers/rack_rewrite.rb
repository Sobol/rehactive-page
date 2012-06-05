RehactivePage::Application.config.middleware.insert_before(Rack::Lock, Rack::Rewrite) do
  r301 %r{.*}, 'http://www.rehactive.pl$&', :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] == 'rehactive.pl'
  }
  
  r301 /galeria(.*)$/, "/"
  r301 "/onas", "/"
  r301 "/kontakt", "/contacts/new"
  r301 /oferta(.*)$/, "/offer"
  r301 "/twoja-wizita", "/"
end


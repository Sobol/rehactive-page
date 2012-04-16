ActionMailer::Base.delivery_method = 'smtp'.to_sym

ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => "rehactive@gmail.com",
  :password             => ENV['GM_PASS'],
  :authentication       => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options = {
  :host => "www.rehactive.com"
}


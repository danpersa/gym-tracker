OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
             :scope => 'email'
  else
    provider :facebook, '210991972417129', '6c9ed760bf5b421aa388780300f148b2',
             :scope => 'email'
  end
end
Rails.application.config.middleware.use OmniAuth::Builder do
 provider :github, ENV['3c724626844050a50163'], ENV['78f8503e50e294cf0ad8a6221b3cb1deb1e88555']
end
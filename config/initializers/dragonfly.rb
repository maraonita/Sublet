require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "a8a89d16b11f1ff5abf046216e75cd7044dc71792c5e3d2e1ebc458ba7f3ebae"

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  else
    datastore :s3,
              bucket_name: ENV["BUCKET_NAME"],
              access_key_id: ENV["ACCESS_KEY_ID"],
              secret_access_key: ENV["SECRET_ACCESS_KEY"],
              url_scheme: 'https'
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end

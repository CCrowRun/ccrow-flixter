# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_public     = false     
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AWS_ACCESS_KEY"],                        # required unless using use_iam_profile
    aws_secret_access_key: ENV["AWS_SECRET_KEY"],                        # required unless using use_iam_profile
   }
  config.fog_directory  ENV["AWS_BUCKET"]                                      # required
  
end
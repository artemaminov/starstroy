CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                 => 'ap-northeast-1',
      # :host                   => 's3-ap-northeast-1.amazonaws.com',
      # :endpoint               => 'https://s3-ap-northeast-1.amazonaws.com:443'
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME']
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"}
end

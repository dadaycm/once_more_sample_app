if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => 'AKIAJ2ODS6Y5ZFKEZUGQ', #ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => '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' #ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  'photo4heroku' #ENV['S3_BUCKET']
  end
end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJYVYE2DCLFJKXV7A',                        # required
    :aws_secret_access_key  => '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',
    :region                => 'us-west-2'                        # required
  }
  config.fog_directory  = 'uzls1'                    # required
end

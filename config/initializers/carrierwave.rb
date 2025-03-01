CarrierWave.configure do |config|
  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    config.storage    = :aws
    config.aws_bucket = Rails.application.credentials.dig(:aws, :bucket) || ENV.fetch('S3_BUCKET_NAME') # for AWS-side bucket access permissions config, see section below
    config.aws_acl    = 'private'

    # The maximum period for authenticated_urls is only 7 days.
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    # Set custom options such as cache control to leverage browser caching.
    # You can use either a static Hash or a Proc.
    config.aws_attributes = -> { {
      expires: 1.week.from_now.httpdate,
      cache_control: 'max-age=604800'
    } }

    config.aws_credentials = {
      access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id) || ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key) || ENV.fetch('AWS_SECRET_KEY'),
      region:            Rails.application.credentials.dig(:aws, :region) || 'ap-southeast-1', # Required
      # stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
    }
  end
end

require 'aws-sdk-s3'
require 'active_storage/service/s3_service'
require 'active_support/core_ext/numeric/bytes'

module ActiveStorage
  class Service::BetterS3Service < Service::S3Service
    attr_reader :client, :bucket, :root, :upload_options, :cdn_url

    def initialize(bucket:, upload: {}, **options)
      @root = options.delete(:root)
      @cdn_url = options.delete(:cdn_url)
      super(bucket: bucket, upload: upload, **options)
    end

    def public_url(key, **client_opts)
      if cdn_url
        File.join cdn_url, object_for(key).key
      else
        super(key, **client_opts)
      end
    end

    def delete_prefixed(prefix)
      prefix = root.present? ? File.join(root, prefix) : prefix
      super prefix
    end

    private

    def object_for(key)
      path = root.present? ? File.join(root, key) : key
      bucket.object(path)
    end
  end
end

require 'active_storage/service/disk_service'

module ActiveStorage
  class Service::TestDiskService < Service::DiskService
    def url_options
      {protocol: "http", host: "cloud-platform.test", port: 80}
    end
  end
end

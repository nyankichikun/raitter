class DeviceRequestHeaders
  attr_reader :headers

  def initialize(request)
    @headers = request.headers
  end

  def invalid?
    return true if invalid_headers?
    false
  end

  private

  def necessary_header
    @necessary_header ||= begin
      ["uid", "client", "access-token"].each_with_object({}) do |header, result|
        result.store(header, headers[header])
      end
    end
  end

  def invalid_headers?
    return necessary_header.include?(nil) ? true : false
  end
end
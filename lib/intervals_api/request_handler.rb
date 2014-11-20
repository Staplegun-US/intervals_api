module IntervalsAPI
  class RequestHandler
    include HTTParty
    base_uri 'https://api.myintervals.com'

    attr_accessor :default_options

    def initialize(token)
      @default_options = {
        headers: {
          'Accept'        => 'application/json',
          'Content-Type'  => 'application/json',
          'Authorization' => "Basic #{Base64.encode64(token + ":X")}"
        }
      }
    end

    %w(get post put delete options).each do |request_type|
      define_method request_type do |url, query = {}|
        RecursiveOpenStruct.new(
          self.class.send(
            request_type,
            url,
            @default_options.deep_merge({ body: query.to_json })
          )
        )
      end
    end
  end
end
